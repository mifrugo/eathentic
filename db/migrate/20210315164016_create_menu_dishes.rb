class CreateMenuDishes < ActiveRecord::Migration[6.0]
  def change
    create_table :menu_dishes do |t|
      t.references :dish, null: false, foreign_key: true
      t.references :menu, null: false, foreign_key: true

      t.timestamps
    end
  end
end
