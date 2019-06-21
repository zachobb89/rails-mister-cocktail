class Favorites < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.boolean :fav, default: false
      t.references :cocktail, foreign_key: true
      t.references :user, foreign_key: true
    end
  end
end
