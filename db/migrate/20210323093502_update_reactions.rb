class UpdateReactions < ActiveRecord::Migration[6.0]
  def change
    change_column :reactions, :name, :integer, using: 'name::integer'  
  end
end
