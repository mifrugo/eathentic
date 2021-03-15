class CreateReviewReactions < ActiveRecord::Migration[6.0]
  def change
    create_table :review_reactions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :review, null: false, foreign_key: true
      t.references :reaction, null: false, foreign_key: true

      t.timestamps
    end
  end
end
