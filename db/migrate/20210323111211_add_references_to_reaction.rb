class AddReferencesToReaction < ActiveRecord::Migration[6.0]
  def change
    add_reference :reactions, :review, null: false, foreign_key: true
    add_reference :reactions, :user, null: false, foreign_key: true
  end
end
