class InvoiceMailer < ActionMailer::Base
  default :from => "info@teatercamp.no"

  def send_invoice(invoice)
    @invoice = invoice
    collecter
    html =    render template: "invoices/show_pdf", assigns: { invoice: @invoice}
    put = PDFKit.new(html).to_pdf
    attachments['faktura.pdf'] = put
    mail(:to => @registration.billing_email, :subject => "Faktura")
  end

  def send_reminder(invoice)
    @invoice = invoice
    collecter
    html = render template: "invoices/show_pdf", assigns: { invoice: @invoice}
    attachments['faktura.pdf'] = PDFKit.new(html).to_pdf
     mail(:to => @registration.billing_email, :subject => "Påminnelse")
  end

  def send_credit_note(invoice)
    @credit_note = invoice
    @invoice = invoice.invoice
    collecter
    html = render template: "invoices/show_credit_note", assigns: { invoice: @invoice}
    put = PDFKit.new(html).to_pdf
    attachments['Kredittnota.pdf'] = PDFKit.new(html).to_pdf
     mail(:to => @registration.billing_email, :subject => "Kreditnota")
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
