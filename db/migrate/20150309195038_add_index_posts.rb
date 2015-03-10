class AddIndexPosts < ActiveRecord::Migration
  def change
    add_index :posts, :title
    add_index :posts, :body, :length => {:body => 5 }
    add_index :posts, :created_at
    add_index :posts, :updated_at
  end
end
