json.array! @restaurants do |restaurant|
  json.extract! restaurant, :id, :name, :latitude, :longitude, :address
end
