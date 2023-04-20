class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
        t.string :body
        t.references :user
        t.references :dream
        t.references :parent, foreign_key: { to_table: :comments }
      t.timestamps
    end
  end
end
