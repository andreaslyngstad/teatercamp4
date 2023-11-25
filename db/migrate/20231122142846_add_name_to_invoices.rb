class AddNameToInvoices < ActiveRecord::Migration[7.0]
  def change
    add_column :invoices, :name, :string
    add_column :invoices, :billing_email, :string
    add_column :invoices, :camp_name, :string
  end
end
