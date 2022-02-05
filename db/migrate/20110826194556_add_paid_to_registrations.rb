class AddPaidToRegistrations < ActiveRecord::Migration[7.0]
  def self.up
    add_column :registrations, :paid, :boolean
  end

  def self.down
    remove_column :registrations, :paid
  end
end
