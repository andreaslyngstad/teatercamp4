class AddDiscountToInvoice < ActiveRecord::Migration[7.0]
  def change
     add_column :invoices, :discount, :float
     add_column :invoices, :discount_text, :text
  end
end
