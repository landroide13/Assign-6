class AddBodyToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :body, :text
    add_column :posts, :wall_user_id, :integer
  end
end
