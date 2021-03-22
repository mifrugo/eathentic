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
    { name: 'Florence', longitude: '43.7696', latitude: '11.2558' },
    { name: 'Rome', longitude: '41.902782', latitude: '12.496366' },
    { name: 'Venice', longitude: '45.4408', latitude: '12.3155' },
    { name: 'Naples', longitude: ' 40.8518', latitude: '14.2681' },
    { name: 'Verona', longitude: ' 45.433334', latitude: '10.983333' },
    { name: 'Milan', longitude: ' 45.464664', latitude: '9.188540' },
  ]

  puts "Creating users..."
  10.times do
    User.create!(
      nickname: Faker::Internet.username,
      email: Faker::Internet.email,
      password: 'helloworld',
      cuisine_id: Cuisine.all.sample.id
    )
  end

  DISHES = [
    { name: 'Pizza Margherita',
      description: 'Tomato sauce and mozarella',
      user_id: User.all.sample.id,
      photo: 'margherita.jpeg'
    },

    { name: 'Pizza Napoli',
      description: 'Tomato sauce, mozarella, anchovies',
      user_id: User.all.sample.id,
      photo: 'napoli.jpeg'
    },

    { name: 'Pizza Diavola',
      description: 'Tomato sauce, mozarella, pepperoni(spicy salami)',
      user_id: User.all.sample.id,
      photo: 'diavola.jpeg'
    },

    { name: 'Pizza Capricciosa',
      description: 'Tomato sauce, mozarella, parma-ham, olives, artichokes, egg',
      user_id: User.all.sample.id,
      photo: 'capricciosa.jpeg'
    },

    { name: 'Pizza 4 Cheese',
      description: 'Gorgonzola, fontina, edamer, mozarella',
      user_id: User.all.sample.id,
      photo: '4formagi.jpeg'
    },

    { name: 'Pizza with Salmon',
      description: 'Mozarella and smoked Salmon',
      user_id: User.all.sample.id,
      photo: 'salmone.jpeg'
    },

    { name: 'Pizza Boscaiola',
      description: 'Mozarella , champignion, sausage',
      user_id: User.all.sample.id,
      photo: 'boscaiola.jpeg'
    },

    { name: 'Pizza Fior di Zucca',
      description: 'Mozarella , anchovies, courgette flowers',
      user_id: User.all.sample.id,
      photo: 'zucca.jpeg'
    },

    { name: 'Pizza Funghi',
      description: 'Mozarella , anchovies, courgette flowers',
      user_id: User.all.sample.id,
      photo: 'funghi.jpeg'
    },

    { name: 'Pizza with Tuna',
      description: 'Tomato sauce, mozarella, tuna',
      user_id: User.all.sample.id,
      photo: 'tonno.jpeg'
    },
  ]

  puts "Creating locations..."
  LOCATIONS.each do |location|

    new_location = Location.create!(
      name: location[:name],
      latitude: location[:latitude],
      longitude: location[:longitude]
    )

    new_location.photos.attach(io: File.open(Rails.root.join('public', 'images', 'cities', "#{location[:name].downcase}.jpeg")), filename:"#{location[:name].downcase}.jpeg")
  end

  restaurants = [
      {name: "Seu Pizza Illuminati",
      description: "Try our signature pizza made with the best ingredients",
      latitude: 41.8795008,
      longitude: 12.4680942,
      photo: "seupizza.jpeg",
      dish: ["pizza margherita", "pizza with tuna", "pizza fior di zucca", "pizza diavola"]
      },

      {name: "Nannarella",
      description: "Italian pasta",
      latitude: 41.888943,
      longitude: 12.470629,
      photo: "nannarella.jpeg"
      },

      {name: "Tonnarello",
      description: "Pasta homemade",
      latitude: 41.889622,
      longitude: 12.468848,
      photo: "tonarello.jpeg"
      },

      {name: "Trattoria Monti",
      description: "Italian cuisine",
      latitude: 41.895805,
      longitude: 12.501163,
      photo: "monti.jpeg"
      },

      {name: "Armando al Pantheon",
      description: "Traditional Italian cuisine",
      latitude: 41.899067,
      longitude: 12.47615051,
      photo: "armando.jpeg"
      },

      {name: "ilSanlorenzo",
      description: "Italian Fish Cuisine",
      latitude: 41.895210,
      longitude: 12.474231,
      photo: "ilSanlorenzo.jpeg"
      },

      {name: "Flavio al Velavevodetto",
      description: "Most creamy Carbonara",
      latitude: 41.875015,
      longitude: 12.475028,
      photo: "velavevodetto.jpeg"
      },

      {name: "Da Remo",
      description: "Roman Pizza",
      latitude: 41.880154,
      longitude: 12.475126,
      photo: "remo.jpeg",
      dish: ["pizza 4 cheese", "pizza napoli", "pizza fior di zucca", "pizza diavola"]
      },

      {name: "La Gatta Mangiona",
      description: "One of the best roman Pizza",
      latitude: 41.876804,
      longitude: 12.449211,
      photo: "gattamangiona.jpeg",
      dish: ["pizza margherita", "pizza with tuna", "pizza salmon", "pizza diavola"]
      },

      {name: "Antico Arco",
      description: "Special Caccio e Peppe with Fior di Zucca",
      latitude: 41.888294,
      longitude: 12.461287,
      photo: "antico.jpeg",
      dish: ["pizza margherita", "pizza salmon"]
      },

      {name: "Pizzarium",
      description: "Special pizza to go - tomato and origano",
      latitude: 41.906894,
      longitude: 12.446501,
      photo: "piazzarum.jpeg",
      dish: ["pizza margherita", "pizza with tuna", "pizza salmon", "pizza diavola", "pizza capricciosa", "pizza boscaiola"]
      },

      {name: "La Pergola",
      description: "The only 3 star Michelin restaurant in Rome - Carbonara special",
      latitude: 41.919277,
      longitude: 12.446052,
      photo: "la-pergola.jpeg"
      },

      {name: "Maccheroni",
      description: "The pasta home",
      latitude: 41.900814,
      longitude: 12.476006,
      photo: "maccheroni.jpeg"
      },

      {name: "Osteria delle Coppelle",
      description: "Deliscious pasta - with a touch of class",
      latitude: 41.900814,
      longitude: 12.476007,
      photo: "copelle.jpeg"
      },

      {name: "Da Alfredo",
      description: "The real Alfredo pasta",
      latitude: 41.905842,
      longitude: 12.477081,
      photo: "alfredo-roma.jpeg"
      },

      {name: "180g Pizzeria Romana",
      description: "Winner for the best roman pizza",
      latitude: 41.878383,
      longitude: 12.564086,
      photo: "180gr.jpeg",
      dish: ["pizza margherita", "pizza with tuna", "pizza salmon", "pizza diavola", "pizza napoli", "pizza boscaiola", "pizza capricciosa"]
      },

      {name: "Il Marchese",
      description: "Traditional roman dishes for the real food lovers",
      latitude: 41.906169,
      longitude: 12.47567,
      photo: "marchese.jpeg"
      },

      {name: "Da Enzo al 29",
      description: "Serving Roman classics such as artichokes",
      latitude: 41.888217,
      longitude: 12.477868,
      photo: "DaEnzo.jpeg"
      },

      {name: "Osteria Fratelli Mori",
      description: "Family owned - focused in traditional roman plates",
      latitude: 41.874469,
      longitude: 12.479316,
      photo: "moro.jpeg"
      },

      {name: "Roscioli salumeria con cucina",
      description: "Bustling destination with an eatery serving Italian fare, plus a bakery, deli counter & wine shop",
      latitude: 41.894264,
      longitude: 12.474406,
      photo: "Roscioli.jpeg"
      },

      {name: "Felice a Testaccio",
      description: "Serving the best Caccio e Peppe - signature dish",
      latitude: 41.87833,
      longitude: 12.477421,
      photo: "felice.jpeg"
      },

      {name: "L'Arcangelo",
      description: "Serving the best Ammatriciana in Rome",
      latitude: 41.907054,
      longitude: 12.470369,
      photo: "larcangelo.jpeg"
      },

      {name: "Da Cesare al Casaletto",
      description: "The Real Gricia made with love",
      latitude: 41.868041,
      longitude: 12.438498,
      photo: "cezare.jpeg"
      },

      {name: "Pinsere",
      description: "Try some of the best pinsa in Rome",
      latitude: 41.9076293,
      longitude: 12.4977726,
      photo: "pinsere.jpeg",
      dish: ["pizza margherita", "pizza with tuna", "pizza salmon", "pizza diavola", "pizza funghi", "pizza boscaiola"]
      },

      {name: "Mizzica",
      description: "Sicilian deliscious food - try our cannolo",
      latitude: 41.911964,
      longitude: 12.517305,
      photo: "mizzica.jpeg"
      },

      {name: "Pompi",
      description: "The King of Tiramissu in Rome.",
      latitude: 41.880188,
      longitude: 12.513369,
      photo: "pompi.jpeg"
      },

      {name: "PummaRe Prati",
      description: "The pizza home",
      latitude: 41.909610,
      longitude: 12.451728,
      photo: "pummare.jpeg",
      dish: ["pizza margherita", "pizza with tuna", "pizza salmon", "pizza diavola",  "pizza funghi"]
      },

      {name: "ArtePizza",
      description: "Where art meets with pizza",
      latitude: 41.909610,
      longitude: 12.451728,
      photo: "artepizza.jpeg",
      dish: ["pizza salmon", "pizza diavola", "pizza fior di zucca", "pizza 4 cheese"]
      },

      {name: "Pizzeria Mimì Cocó",
      description: "Food for people with taste",
      latitude: 41.855693,
      longitude: 12.480520,
      photo: "mimicoco.jpeg",
      dish: ["pizza margherita", "pizza diavola"]
      },

      {name: "Momart Restaurant Cafè",
      description: "Try the best finger-food in Rome: The most rated aperitivo",
      latitude: 41.919063,
      longitude: 12.519779,
      photo: "momart.jpeg",
      dish: ["pizza with tuna", "pizza salmon", "pizza diavola"]
      }
    ]

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
  restaurants.each do |restaurant|
    rest = Restaurant.create!(
      cuisine_id: Cuisine.where(name: 'Italian').first.id,
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
      restaurant[:dish].each do |dish| #Pizza margherita
        dish = Dish.find_by("lower(name) = ?", dish.downcase) # name = 'Pizza margherita'
        if dish # se esiste
        MenuDish.create!(menu_id: menu.id, dish_id: dish.id) # Crea il record nella join table
                                                             # tra menu del ristorante e il dish
        end
      end
    end
  end

   thai_rm_restaurants = [
      {name: "Siam Cuisine",
      description: "Try our original dishes, you won't regret 😉",
      latitude: 41.908727,
      longitude: 12.491607,
      photo: "siamc.jpg",
      dish: []
      },

      {name: "Kisa Cuisine",
      description: "If you're looking for a Thai restaurant in Rome there's nowhere else to go!",
      latitude: 41.937918,
      longitude: 12.5290832,
      photo: "kisa.jpg",
      dish: []
      },

      {name: "Tora Sushi & Asian Cuisine",
      description: "Discover Thai cuisine",
      latitude: 41.8997,
      longitude: 12.473897,
      photo: "tora.jpg",
      dish: []
      },

      {name: "GO Thai",
      description: "Come try our amazing dishes 🍜 ",
      latitude: 41.870986,
      longitude: 12.51806,
      photo: "gothai.jpg",
      dish: []
      },

      {name: "CheKiang Royal Thai",
      description: "Come find us in our elegant location",
      latitude: 41.8845422,
      longitude: 12.5223382,
      photo: "chekiang.jpg",
      dish: []
      },

      {name: "Isola Puket",
      description: "One of the best in Rome!",
      latitude: 41.9343346,
      longitude: 12.514232,
      photo: "puket.jpg",
      dish: []
      },

      {name: "Sukhothai",
      description: "Where real Thai food is",
      latitude: 41.8689654,
      longitude: 12.4612272,
      photo: "suko.jpg",
      dish: []
      },

      {name: "Tuk Tuk Ride",
      description: "Best Pad Kra Prao in town",
      latitude: 41.8593857,
      longitude: 12.4814724,
      photo: "tuk.jpg",
      dish: []
      },

      {name: "Bali Bar",
      description: "Thai restaurant in Trastevere",
      latitude: 41.8904841,
      longitude: 12.4673209,
      photo: "balibar.jpg",
      dish: []
      },

      {name: "Han Thai",
      description: "Your local Thai restaurant 😋",
      latitude: 41.7569845,
      longitude: 12.3668536,
      photo: "hanthai.jpg",
      dish: []
      },

      {name: "L'Oasi del Gusto",
      description: "Thai cuisine as we see it!",
      latitude: 41.8917016,
      longitude: 12.5617941,
      photo: "oasi.jpg",
      dish: []
      },

      {name: "Taste East",
      description: "You won't regret 😉",
      latitude: 41.8732174,
      longitude: 12.4408623,
      photo: "tastethai.jpg",
      dish: []
      },

      {name: "Thai J",
      description: "Discover authentc Thai cuisine",
      latitude: 41.9118548,
      longitude: 12.449925,
      photo: "tjay.jpg",
      dish: []
      },

      {name: "Ya Yuan",
      description: "We are waiting for you!",
      latitude: 41.980654,
      longitude: 12.5080232,
      photo: "yayuan.jpg",
      dish: []
      },

      {name: "Thai Inn",
      description: "Your new favorite Thai restaurant!",
      latitude: 41.8792114,
      longitude: 12.5082463,
      photo: "inn.jpg",
      dish: []
      },

      {name: "Kishi",
      description: "Elegant location, fine cuisine",
      latitude: 41.8961589,
      longitude: 12.4307924,
      photo: "kishi.jpg",
      dish: []
      },

      {name: "Kung Fu",
      description: "",
      latitude: 45.6947423,
      longitude: 9.0403104,
      photo: "kungfu.jpg",
      dish: []
      },

      {name: "Sandokan",
      description: "Our amazing dishes will make you fall in love 💘",
      latitude: 41.8601919,
      longitude: 12.5577868,
      photo: "sandokan.jpg",
      dish: []
      }

   ]

   puts "Creating Thai restaurants..."
   thai_rm_restaurants.each do |restaurant|
    rest = Restaurant.create!(
      cuisine_id: Cuisine.where(name: 'Thai').first.id,
      user_id: User.all.sample.id,
      location_id: Location.where(name: "Rome").first.id,
      name: restaurant[:name],
      description: restaurant[:description],
      latitude: restaurant[:latitude],
      longitude: restaurant[:longitude]
    )

     rest.photos.attach(io: File.open(Rails.root.join('public', 'images',
    'restaurant-img', restaurant[:photo])), filename: restaurant[:photo])

   end

   puts "Creating restaurants from Google Places"
   Dir.glob("#{Rails.root}/db/restaurants/*.json").map do |json_file|
    puts json_file
    json = JSON.parse(File.read(json_file))
    json.each do |r|

      rest = Restaurant.create!(
        cuisine_id: Cuisine.where(name: 'Italian').first.id,
        user_id: User.all.sample.id,
        location_id: Location.where(name: "Milan").first.id,
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


  # puts "Creating other stuff..."
  # 10.times do
  #   Menu.create!(
  #     user_id: User.all.sample.id,
  #     restaurant_id: Restaurant.all.sample.id,
  #     name: Faker::Artist.name,
  #     order: rand(1..10)
  #   )

  #   MenuDish.create!(
  #     dish_id: Dish.all.sample.id,
  #     menu_id: Menu.all.sample.id
  #   )

  #   Ingredient.create!(
  #     name: Faker::Food.vegetables,
  #     description: Faker::Food.description,
  #     user_id: User.all.sample.id
  #   )

  #   DishIngredient.create!(
  #     dish_id: Dish.all.sample.id,
  #     ingredient_id: Ingredient.all.sample.id
  #   )
  # end
