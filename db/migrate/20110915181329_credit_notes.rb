class CreditNotes < ActiveRecord::Migration[7.0]
  def self.up
    create_table :credit_notes do |t|
      t.integer :invoice_id
      t.float :total

      t.timestamps
  end

  def self.down
    drop_table :credit_notes
  end
  end
end
