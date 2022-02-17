class AddActiveToPeople < ActiveRecord::Migration[7.0]
  def change
     add_column :people, :active, :boolean
  end
end
