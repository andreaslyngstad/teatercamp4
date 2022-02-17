class InvoiceMailer < ActionMailer::Base
  default :from => "info@teatercamp.no"

  def send_invoice(invoice)
    @invoice = invoice
    collecter

    sut = render_to_string(show_pdf_url(invoice))

    put = PDFKit.new(sut).to_pdf
    attachments['faktura.pdf'] = PDFKit.new(sut).to_pdf
    mail(:to => @registration.billing_email, :subject => "Faktura", :bcc => 'faktura@teatercamp.no')
  end
  def send_reminder(invoice)
    @invoice = invoice
    collecter
    html = render_to_string(:action => "../show_pdf.html.erb")
     mail(:to => @registration.billing_email, :subject => "Påminnelse", :bcc => 'faktura@teatercamp.no') do |format|
      format.text
      format.html
      format.pdf do
        attachments['faktura.pdf'] = PDFKit.new(html).to_pdf
      end
    end
  end
  def send_credit_note(invoice)
    @credit_note = invoice
    @invoice = invoice.invoice
    collecter
    html = render_to_string(:action => "../show_credit_note.html.erb")
     mail(:to => @registration.billing_email, :subject => "Kreditnota", :bcc => 'faktura@teatercamp.no') do |format|
      format.text
      format.html
      format.pdf do
        attachments['Kredittnota.pdf'] = PDFKit.new(html).to_pdf
      end
    end
  end
private

  def collecter
    @registration = @invoice.registration
    @camp = @registration.camp
    option = Option.first
    @vat = option.vat_number
    @account = option.account
  end

end
