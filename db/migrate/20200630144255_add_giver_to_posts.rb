class AddGiverToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :giver, :string
  end
end
