class RemoveMenuFromDish < ActiveRecord::Migration[6.0]
  def change
    remove_reference :dishes, :menu
  end
end
