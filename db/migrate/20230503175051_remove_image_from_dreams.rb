class RemoveImageFromDreams < ActiveRecord::Migration[7.0]
  def change
    remove_column :dreams, :image
  end
end
