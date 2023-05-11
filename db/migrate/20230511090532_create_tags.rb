class CreateTags < ActiveRecord::Migration[7.0]
  def change
    create_table :tags do |t|
      t.string :name
      t.timestamps
    end

    create_table :dreams_tags, id: false do |t|
      t.belongs_to :dream
      t.belongs_to :tag
    end
  end
end
