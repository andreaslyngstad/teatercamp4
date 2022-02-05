class AddLeadToPosts < ActiveRecord::Migration[7.0]
  def self.up
    add_column :posts, :lead, :text
  end

  def self.down
    remove_column :posts, :lead
  end
end
