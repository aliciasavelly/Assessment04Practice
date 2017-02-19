class AddIndeCommentsIds < ActiveRecord::Migration
  def change
    add_index :comments, :user_id
    add_index :comments, :link_id
  end
end
