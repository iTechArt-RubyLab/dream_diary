class RemoveTagsFromDreams < ActiveRecord::Migration[7.0]
  def change
    remove_column :dreams, :tags, :text
  end
end
