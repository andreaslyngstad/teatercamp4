class AddFrontToBlog < ActiveRecord::Migration[7.0]
  def change
     add_column :posts, :front, :boolean
     add_column :posts, :color, :string
  end
end
