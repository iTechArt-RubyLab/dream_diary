class RemoveImageFromCategories < ActiveRecord::Migration[7.0]
  def change
    remove_column :categories, :image
  end
end
