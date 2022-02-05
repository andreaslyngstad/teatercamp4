class CreatePosts < ActiveRecord::Migration[7.0]
  def self.up
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.integer :author_id
      t.string :status
      

      t.timestamps
    end
  end

  def self.down
    drop_table :posts
  end
end
