class InvoicesController < ApplicationController
  layout :resolve_layout

  def index
    @invoices = Invoice.includes(:registration, :credit_note).where('made_date > ?', Time.now.prev_year(2)).order(made_date:"DESC")
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @invoices }
    end
  end

  def all_invoices
    @invoices = Invoice.includes(:registration, :credit_note)
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @invoices }
    end
  end

  def show
    @invoice = Invoice.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @invoice }
    end
  end

  def show_pdf
    @invoice = Invoice.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @invoice }
    end
  end

  def download_pdf
	  @invoice = Invoice.find(params[:id])
	  html = render_to_string(template: 'invoices/show_pdf/', locals: {invoice: @invoice })
	  pdf = PDFKit.new(html)
	  send_data(pdf.to_pdf, :filename => "faktura_#{@invoice.number}.pdf", :type => 'application/pdf')
	end


  def create
    @invoice = Invoice.new(invoice_params)

    respond_to do |format|
      if @invoice.save
        format.html { redirect_to(@invoice, :notice => 'Invoice was successfully created.') }
        format.xml  { render :xml => @invoice, :status => :created, :location => @invoice }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @invoice.errors, :status => :unprocessable_entity }
      end
    end
  end

  def invoice_send
    @invoice = Invoice.find(params[:id])
    if @invoice.made_date.nil?
      @invoice.made_date = Time.now
      @invoice.pay_by = Time.now + 14.days
    end
    @invoice.sent = true
    @invoice.save
     respond_to do |wants|
       if InvoiceMailer.send_invoice(@invoice).deliver
       wants.js
     end
     end
  end

  def reminder_send
    @invoice = Invoice.find(params[:id])
    @invoice.reminder_date = Time.now
    @invoice.save
    respond_to do |wants|
       if InvoiceMailer.send_reminder(@invoice).deliver
       wants.js
     end
     end
  end
  def set_paid
     @invoice = Invoice.find(params[:id])
    if @invoice.paid == true
      @invoice.paid = false
    else
      @invoice.paid = true
    end
    respond_to do |format|
      if @invoice.save
        format.js

      else
        format.html { render :action => "index" }
        format.xml  { render :xml => @invoice.errors, :status => :unprocessable_entity }
      end
    end
  end
  def credit_note
    @invoice = Invoice.find(params[:id])
    @credit_note = CreditNote.new
    @credit_note.invoice = @invoice
    @credit_note.total = -(@invoice.registration.camp.products.sum(:total_price))
    if @credit_note.save
      respond_to do |wants|
         if InvoiceMailer.send_credit_note(@credit_note).deliver
         wants.js
       end
     end
    end
  end
  def show_credit_note
    @credit_note = CreditNote.find(params[:id])
    @invoice = @credit_note.invoice
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @credit_note }
    end
  end
  def totals
    if !params[:year].nil?
      start_time = (params[:year]).values.join("-").to_time
    else
    start_time = Time.now
    end
    @time = start_time
    @invoices = Invoice.where(:paid => true, :made_date => start_time.beginning_of_year..start_time.end_of_year)
  end

  def resolve_layout
    case action_name
    when "show_pdf"
      "pdf_layout"
    else
      "application"
    end
  end

  private

  def generate_pdf(invoice)
    html = render_to_string(:action => :show_pdf, :layout => false)
    pdf = PDFKit.new(html).to_pdf
    send_data(pdf,
     :filename    => "faktura{@invoice.number }.pdf",
     :disposition => 'attachment')
    Prawn::Document.new do
      text client.name, align: :center
      text "Address: #{client.address}"
      text "Email: #{client.email}"
    end.render
  end
  def invoice_params
    params.require(:invoice).permit(
      :registration_id,
      :number,
      :created_at,
      :updated_at,
      :paid,
      :sent,
      :made_date,
      :pay_by,
      :reminder_date
    )
  end
end
