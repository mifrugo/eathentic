class Location < ApplicationRecord
  has_many :restaurants

  has_many_attached :photos
end
