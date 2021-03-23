class MenuDish < ApplicationRecord
  belongs_to :dish
  belongs_to :menu

  validates :dish, uniqueness: { scope: :menu }
end
