class AddLocationRefToRestaurants < ActiveRecord::Migration[6.0]
  def change
    add_reference :restaurants, :location, null: false, foreign_key: true
  end
end
