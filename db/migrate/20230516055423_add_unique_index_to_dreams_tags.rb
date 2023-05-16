class AddUniqueIndexToDreamsTags < ActiveRecord::Migration[7.0]
  def change
    add_index :dreams_tags, [:dream_id, :tag_id], unique: true
  end
end
