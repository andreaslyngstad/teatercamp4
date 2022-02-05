class AddPublicToCamps < ActiveRecord::Migration[7.0]
  def self.up
    add_column :camps, :public, :boolean

  end

  def self.down
    remove_column :camps, :public
  end
end
