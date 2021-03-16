require 'faker'

    LOCATIONS =  [
  { name: 'Bari', longitude: '41.117142', latitude: '16.871872' },
  { name: 'Roma', longitude: '41.902782', latitude: '12.496366' },
  { name: 'Bergamo', longitude: '45.695000', latitude: '9.670000' },
  { name: 'Monza', longitude: ' 45.583332', latitude: '9.266667' },
  { name: 'Verona', longitude: ' 45.433334', latitude: '10.983333' },
  { name: 'Milano', longitude: ' 45.464664', latitude: '9.188540' },
]

  MenuDish.destroy_all
  Menu.destroy_all
  DishIngredient.destroy_all
  Dish.destroy_all
  Restaurant.destroy_all
  Ingredient.destroy_all
  User.destroy_all
  Cuisine.destroy_all
  Location.destroy_all






  ["italian", "chinese", "japanese","french", "indian", "thai"].each do |cuisine|
    Cuisine.create(name: cuisine.capitalize)
  end

  10.times do
    User.create!(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      email: Faker::Internet.email,
      password: 'helloworld',
      cuisine_id: Cuisine.all.sample.id
    )

    Dish.create!(
      name: Faker::Food.dish,
      description: Faker::Food.description,
      user_id: User.all.sample.id
    )


    location = LOCATIONS.sample

    Location.create!(
      name: location[:name],
      latitude: location[:latitude],
      longitude: location[:longitude]
    )

    Restaurant.create!(
      cuisine_id: Cuisine.all.sample.id,
      user_id: User.all.sample.id,
      location_id: Location.all.sample.id,
      name: Faker::Restaurant.name,
      description: Faker::Restaurant.type,
      latitude: location[:latitude],
      longitude: location[:longitude]
    )

    Menu.create!(
      user_id: User.all.sample.id,
      restaurant_id: Restaurant.all.sample.id,
      name: Faker::Artist.name,
      order: rand(1..10)
    )

    MenuDish.create!(
      dish_id: Dish.all.sample.id,
      menu_id: Menu.all.sample.id
    )

    Ingredient.create!(
      name: Faker::Food.vegetables,
      description: Faker::Food.description,
      user_id: User.all.sample.id
    )

    DishIngredient.create!(
      dish_id: Dish.all.sample.id,
      ingredient_id: Ingredient.all.sample.id

    )

  end
