class AddFieldsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :cuisine, null: false, foreign_key: true
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :nickname, :string
  end
end
