class CreateInvoiceLines < ActiveRecord::Migration[7.0]
  def change
    create_table :invoice_lines do |t|
      t.float :total_price
      t.string :description
      t.float :vat
      t.string :camp_name
      t.integer :invoice_id
      t.timestamps
    end
  end
end
