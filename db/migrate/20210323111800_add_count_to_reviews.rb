class AddCountToReviews < ActiveRecord::Migration[6.0]
  def change
    add_column :reviews, :counter, :integer, default: 0 
  end
end
