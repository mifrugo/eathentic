require 'faker'

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

  LOCATIONS =  [
    { name: 'Bari', longitude: '41.117142', latitude: '16.871872' },
    { name: 'Roma', longitude: '41.902782', latitude: '12.496366' },
    { name: 'Bergamo', longitude: '45.695000', latitude: '9.670000' },
    { name: 'Monza', longitude: ' 45.583332', latitude: '9.266667' },
    { name: 'Verona', longitude: ' 45.433334', latitude: '10.983333' },
    { name: 'Milano', longitude: ' 45.464664', latitude: '9.188540' },
  ]

  puts "Creating locations..."
  LOCATIONS.each do |location|
    Location.create!(location)
  end

  restaurants = [
      {name: "Mizio's Street Food",
      description: "Italian street food",
      latitude: 41.895000,
      longitude: 12.490960
      },

      {name: "Nannarella",
      description: "Italian pasta",
      latitude: 41.888943,
      longitude: 12.470629
      },

      {name: "Tonarello",
      description: "Pasta homemade",
      latitude: 41.889622,
      longitude: 12.468848
      },

      {name: "Trattoria Monti",
      description: "Italian cuisine",
      latitude: 41.895805,
      longitude: 12.501163
      },

      {name: "Armando al Pantheon",
      description: "Traditional Italian cuisine",
      latitude: 41.899067,
      longitude: 12.47615051
      },

      {name: "ilSanlorenzo",
      description: "Italian Fish Cuisine",
      latitude: 41.895210,
      longitude: 12.474231
      },

      {name: "Flavio al Velavevodetto",
      description: "Most creamy Carbonara",
      latitude: 41.875015,
      longitude: 12.475028
      },

      {name: "Da Remo",
      description: "Roman Pizza",
      latitude: 41.880154,
      longitude: 12.475126
      },

      {name: "La Gatta Mangiona",
      description: "One of the best roman Pizza",
      latitude: 41.876804,
      longitude: 12.449211
      },

      {name: "Antico Arco",
      description: "Special Caccio e Peppe with Fior di Zucca",
      latitude: 41.888294,
      longitude: 12.461287
      },

      {name: "Pizzarium",
      description: "Special pizza to go - tomato and origano",
      latitude: 41.906894,
      longitude: 12.446501
      },

      {name: "La Pergola",
      description: "The only 3 star Michelin restaurant in Rome - Carbonara special",
      latitude: 41.919277,
      longitude: 12.446052
      },

      {name: "Maccheroni",
      description: "The pasta home",
      latitude: 41.900814,
      longitude: 12.476006
      },

      {name: "Osteria delle Coppelle",
      description: "Deliscious pasta - with a touch of class",
      latitude: 41.900814,
      longitude: 12.476007
      },

      {name: "Da Alfredo",
      description: "The real Alfredo pasta",
      latitude: 41.905842,
      longitude: 12.477081
      },

      {name: "180g Pizzeria Romana",
      description: "Winner for the best roman pizza",
      latitude: 41.878383,
      longitude: 12.564086
      },

      {name: "Il Marchese",
      description: "Traditional roman dishes for the real food lovers",
      latitude: 41.906169,
      longitude: 12.47567
      },

      {name: "Da Enzo al 29",
      description: "Serving Roman classics such as artichokes",
      latitude: 41.888217,
      longitude: 12.477868
      },

      {name: "Osteria Fratelli Mori",
      description: "Family owned - focused in traditional roman plates",
      latitude: 41.874469,
      longitude: 12.479316
      },

      {name: "Roscioli salumeria con cucina",
      description: "Bustling destination with an eatery serving Italian fare, plus a bakery, deli counter & wine shop",
      latitude: 41.894264,
      longitude: 12.474406
      },

      {name: "Felice a Testaccio",
      description: "Serving the best Caccio e Peppe - signature dish",
      latitude: 41.87833,
      longitude: 12.477421
      },

      {name: "L'Arcangelo",
      description: "Serving the best Ammatriciana in Rome",
      latitude: 41.907054,
      longitude: 12.470369
      },

      {name: "Da Cesare al Casaletto",
      description: "The Real Gricia made with love",
      latitude: 41.868041,
      longitude: 12.438498
      },

      {name: "Supplì Roma",
      description: "Try some of the best suppli in Rome",
      latitude: 41.887184,
      longitude: 12.471801
      },

      {name: "Mizzica",
      description: "Sicilian deliscious food - try our cannolo",
      latitude: 41.911964,
      longitude: 12.517305
      },

      {name: "Pompi",
      description: "The King of Tiramissu in Rome.",
      latitude: 41.880188,
      longitude: 12.513369
      },

      {name: "La'NDuja",
      description: "Calabrian food hot as NDUJA",
      latitude: 41.897998,
      longitude: 12.535683
      },

      {name: "Vuliò",
      description: "Apulian Street food",
      latitude: 41.909423,
      longitude: 12.461657
      },

      {name: "Dar Bottarolo Tiburtina",
      description: "Food for people with taste",
      latitude: 41.91571,
      longitude: 12.53256
      },

      {name: "Momart Restaurant Cafè",
      description: "Try the best finger-food in Rome: The most rated aperitivo",
      latitude: 41.919063,
      longitude: 12.519779
      }
    ]

  puts "Creating users..."
  10.times do
    User.create!(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      email: Faker::Internet.email,
      password: 'helloworld',
      cuisine_id: Cuisine.all.sample.id
    )
  end

  puts "Creating restaurants..."
  restaurants.each do |restaurant|
    rest = Restaurant.create!(
      cuisine_id: Cuisine.where(name: 'Italian').first.id,
      user_id: User.all.sample.id,
      location_id: Location.where(name: "Roma").first.id,
      name: restaurant[:name],
      description: restaurant[:description],
      latitude: restaurant[:latitude],
      longitude: restaurant[:longitude]
    )

    Menu.create!(
      restaurant_id: rest.id,
      user_id: User.all.sample.id,
      name: 'Main'
    )
  end

  puts "Creating other stuff..."
  10.times do
    Dish.create!(
      name: Faker::Food.dish,
      description: Faker::Food.description,
      user_id: User.all.sample.id
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
