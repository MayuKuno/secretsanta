class RemoveCategoryFromGroup < ActiveRecord::Migration[5.0]
  def change
    remove_column :groups, :category, :string
  end
end
