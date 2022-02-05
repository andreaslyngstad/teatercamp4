class AddIngressToCamps < ActiveRecord::Migration[7.0]
  def self.up
  	add_column :camps, :ingress, :text
  end

  def self.down
  	remove_column :camps, :ingress
  end
end
