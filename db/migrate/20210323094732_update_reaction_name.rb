class UpdateReactionName < ActiveRecord::Migration[6.0]
  def change
    rename_column :reactions, :name, :number
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
