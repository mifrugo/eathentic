json.array! @restaurants do |restaurant|
  json.extract! restaurant, :id, :name
  json.type :restaurant
  json.url '/restaurants'
end

json.array! @cuisines do |cuisine|
  json.extract! cuisine, :id, :name
  json.type :cuisine
  json.url '/cuisines'
end

json.array! @dishes do |dish|
  json.extract! dish, :id, :name
  json.type :dish
  json.url '/restaurants/list/dish'
end
