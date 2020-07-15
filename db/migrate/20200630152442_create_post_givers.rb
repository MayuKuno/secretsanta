class CreatePostGivers < ActiveRecord::Migration[5.0]
  def change
    create_table :post_givers do |t|
      t.references :post, foreign_key: true
      t.references :giver, foreign_key: true
      t.timestamps
    end
  end
end
