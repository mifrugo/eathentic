class Location < ApplicationRecord
  has_many :restaurants

  has_many_attached :photos

  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode
end
