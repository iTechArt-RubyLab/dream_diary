class AddCategoryRefToDreams < ActiveRecord::Migration[7.0]
  def change
    remove_column :dreams, :category
    add_reference :dreams, :category, foreign_key: true
  end
end
