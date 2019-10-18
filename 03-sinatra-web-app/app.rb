require "sinatra"
require "sinatra/link_header"
require "sinatra/reloader" if development?

enable :static

get "/" do
  @activities = [
    {"name" => "Visit art museum",
      "category" => "Cultural",
      "city" => "Nantes",
      "img" => "https://img.lemde.fr/2017/06/21/0/0/5991/4507/688/0/60/0/bb0d30a_12331-1p7ls2l.glmcrcc8fr.jpg",
      "duration" => 120,
      "number of participants" => 5,
      "price" => 30
    },

    {"name" => "Diner dans les arbres",
    "category" => "Food",
    "city" => "Nantes",
    "img" => "https://www.moon-event.fr/wp-content/uploads/2016/03/11.png",
    "duration" => 180,
    "number of participants" => 2,
    "price" => 100
    },

    {"name" => "Escape Game",
    "category" => "Adventure",
    "city" => "Paris",
    "img" => "https://unsplash.com/photos/Jv0TBnjzYNM",
    "duration" => 60,
    "number of participants" => 10,
    "price" => 50
    },

    {"name" => "Murder party",
      "category" => "Adventure",
      "city" => "Nantes",
      "img" => "https://unsplash.com/photos/A59lWOrZVnw",
      "duration" => 120,
      "number of participants" => 15,
      "price" => 150
    },

    {"name" => "Cocktail academy",
      "category" => "Food",
      "city" => "Paris",
      "img" => "https://unsplash.com/photos/i7Vy81pnZCI",
      "duration" => 60,
      "number of participants" => 8,
      "price" => 160
    }
  ]
  erb :index
end
