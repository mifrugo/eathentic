require 'faker'
require_relative 'data/dishes'
require_relative 'data/locations'
require_relative 'data/restaurants'


  puts "-----------------------"
  puts "||| Eathentic Seeds |||"
  puts "|||       v2        |||"
  puts "-----------------------"

  MenuDish.destroy_all
  Menu.destroy_all
  DishIngredient.destroy_all
  Dish.destroy_all
  Review.destroy_all
  Restaurant.destroy_all
  Ingredient.destroy_all
  User.destroy_all
  Cuisine.destroy_all
  Location.destroy_all

  puts "Resetting the tables..."
  ActiveRecord::Base.connection.reset_pk_sequence!('users')
  ActiveRecord::Base.connection.reset_pk_sequence!('menu_dishes')
  ActiveRecord::Base.connection.reset_pk_sequence!('dishes')
  ActiveRecord::Base.connection.reset_pk_sequence!('ingredients')
  ActiveRecord::Base.connection.reset_pk_sequence!('cuisines')
  ActiveRecord::Base.connection.reset_pk_sequence!('locations')
  ActiveRecord::Base.connection.reset_pk_sequence!('dish_ingredients')
  ActiveRecord::Base.connection.reset_pk_sequence!('reviews')
  ActiveRecord::Base.connection.reset_pk_sequence!('menus')
  ActiveRecord::Base.connection.reset_pk_sequence!('restaurants')


  puts "Creating cuisines ..."
  ["italian", "chinese", "japanese","french", "indian", "thai"].each do |cuisine|
    Cuisine.create(name: cuisine.capitalize)
  end

  puts "Creating users..."
  10.times do
    User.create!(
      nickname: Faker::Internet.username,
      email: Faker::Internet.email,
      password: 'helloworld',
      cuisine_id: Cuisine.all.sample.id
    )
  end

  puts "Creating locations..."
  LOCATIONS.each do |location|

    new_location = Location.create!(
      name: location[:name],
      latitude: location[:latitude],
      longitude: location[:longitude]
    )

    new_location.photos.attach(io: File.open(Rails.root.join('public', 'images', 'cities', "#{location[:name].downcase}.jpeg")), filename:"#{location[:name].downcase}.jpeg")
  end

  puts "Creating dishes..."
  DISHES.each do |dish|
    new_dish = Dish.create!(
        name: dish[:name],
        description: dish[:description],
        user_id: dish[:user_id]
      )

    new_dish.photos.attach(io: File.open(Rails.root.join('public', 'images',
      'dishes', dish[:photo])), filename: dish[:photo])
  end

  puts "Creating restaurants..."
  RESTAURANTS.each do |restaurant|

    type = restaurant[:type].present? ? restaurant[:type] : "italian"

    rest = Restaurant.create!(
      cuisine_id: Cuisine.find_by("lower(name) = ?", type).id,
      user_id: User.all.sample.id,
      location_id: Location.where(name: "Rome").first.id,
      name: restaurant[:name],
      description: restaurant[:description],
      latitude: restaurant[:latitude],
      longitude: restaurant[:longitude]
    )

 rest.photos.attach(io: File.open(Rails.root.join('public', 'images',
  'restaurant-img', restaurant[:photo])), filename: restaurant[:photo])

    menu = Menu.create!(
      restaurant_id: rest.id,
      user_id: User.all.sample.id,
      name: 'Main'
    )

    if restaurant[:dish].present?
      restaurant[:dish].each do |dish|
        dish = Dish.find_by("lower(name) = ?", dish.downcase)
        MenuDish.create!(menu_id: menu.id, dish_id: dish.id) if dish
      end
    end

  end

  puts "Creating restaurants from Google Places...."
  Dir.glob("#{Rails.root}/db/restaurants/*.json").map do |json_file|
    city = json_file.split("/").last.gsub(/.json/, '')
    puts "#{city.capitalize} seeds..."

    json = JSON.parse(File.read(json_file))
    json.each do |r|

      rest = Restaurant.create!(
        cuisine_id: Cuisine.where(name: 'Italian').first.id,
        user_id: User.all.sample.id,
        location_id: Location.find_by("lower(name) = ?", city).id,
        name: r["name"],
        latitude: r["latitude"],
        longitude: r["longitude"],
        address: r["address"]
      )

      rest.photos.attach(io: URI.open(r["photo"]), filename: r["name"]) if r["photo"]

      menu = Menu.create!(
        restaurant_id: rest.id,
        user_id: User.all.sample.id,
        name: 'Main'
      )

    end
  end
