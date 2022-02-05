class AddCommentCount < ActiveRecord::Migration[7.0]
  def self.up
    add_column :posts, :comments_count, :integer, :limit => 4, :default => 0, :null => false
  end
  def self.down
    remove_column :posts, :comments_count
  end
end
