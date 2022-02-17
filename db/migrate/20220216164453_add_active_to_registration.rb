class AddActiveToRegistration < ActiveRecord::Migration[7.0]
  def change
     add_column :registrations, :active, :boolean
  end
end
