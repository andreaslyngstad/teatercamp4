class CreatePages < ActiveRecord::Migration[7.0]
  def self.up
    create_table :pages do |t|
      t.string :name
      t.string :title
      t.text :body
      t.integer :parent_id
      t.string :navlabel
      t.integer :lft
      t.integer :rgt
      t.integer :proposed_parent_id, :limit => 11
      t.timestamps
    end
  end

  def self.down
    drop_table :pages
  end
end
