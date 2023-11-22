require File.dirname(__FILE__) + '/../../lib/app_logic.rb'
class Invoice < ActiveRecord::Base
  belongs_to :registration
  has_one :credit_note
  has_many :products, through: :registration
  has_many :invoice_lines

  def total_price
    invoice_lines.sum(:total_price)
  end
  def total_eks_vat
    a = 0
    invoice_lines.each do |p|
      a += p.eks_vat
    end
    a
  end
  def total_vat
    invoice_lines.sum(:total_price) - total_eks_vat
  end
  def if_discount
    if discount.nil?
       0
     else
       discount
     end
  end

  def add_products_to_lines
    if self.invoice_lines.empty?
    products.each do |p|
      i = InvoiceLine.new
      i.total_price = p.total_price
      i.vat         = p.vat
      i.description = p.description
      i.invoice_id  = id
      i.save
    end
  end
    self.name = registration.name 
    self.billing_email = registration.billing_email 
    self.camp_name = registration.camp.name
    self.save
  end

end
