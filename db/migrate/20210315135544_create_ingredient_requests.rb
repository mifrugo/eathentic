class CreateIngredientRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :ingredient_requests do |t|
      t.string :name
      t.text :description
      t.references :ingredient, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
