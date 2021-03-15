class RemoveDishFromIngredients < ActiveRecord::Migration[6.0]
  def change
    remove_reference :ingredients, :dish
  end
end
