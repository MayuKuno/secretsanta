class CreateGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :groups do |t|
      t.string :name, null: false
      t.string :budget, null: false
      t.string :category, null: false
      t.string :period, null: false
      t.index :name, unique: true
      t.timestamps
    end
  end
end
