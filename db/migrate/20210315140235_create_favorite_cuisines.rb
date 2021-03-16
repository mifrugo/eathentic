class CreateFavoriteCuisines < ActiveRecord::Migration[6.0]
  def change
    create_table :favorite_cuisines do |t|
      t.references :cuisine, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
