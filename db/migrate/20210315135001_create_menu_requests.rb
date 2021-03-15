class CreateMenuRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :menu_requests do |t|
      t.string :name
      t.references :menu, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
