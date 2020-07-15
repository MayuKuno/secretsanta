class RemoveGiverIdFromPosts < ActiveRecord::Migration[5.0]
  def change
    remove_column :posts, :giver_id, :integer
  end
end
