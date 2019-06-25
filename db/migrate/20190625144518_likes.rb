class Likes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.integer :like
      t.integer :unlike
      t.references :review, foreign_key: true
      t.references :user, foreign_key: true
      t.references :cocktail, foreign_key: true

      t.timestamps
    end
  end
end
