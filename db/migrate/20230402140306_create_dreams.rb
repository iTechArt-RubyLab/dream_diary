class CreateDreams < ActiveRecord::Migration[7.0]
  def change
    create_table :dreams do |t|
      t.date :date
      t.integer :duration
      t.string :title
      t.text :description
      t.string :image
      t.string :category
      t.text :tags
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
