class RemoveUsergiverIdFromPosts < ActiveRecord::Migration[5.0]
  def change
    remove_column :posts, :usergiver_id, :integer
  end
end
