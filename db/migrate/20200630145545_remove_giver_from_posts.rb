class RemoveGiverFromPosts < ActiveRecord::Migration[5.0]
  def change
    remove_column :posts, :giver, :string
  end
end
