json.restaurants @restaurants do |restaurant|
  json.extract! restaurant, :id, :name
end

json.cuisines @cuisines do |cuisine|
  json.extract! cuisine, :id, :name
end

json.dishes @dishes do |dish|
  json.extract dish, :id, :name
end
