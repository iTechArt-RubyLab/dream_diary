class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string :name
      t.string :description
      t.string :image
      t.integer :status, default: 0
      t.integer :dreams_count, default: 0
      t.timestamps
    end
  end
end
