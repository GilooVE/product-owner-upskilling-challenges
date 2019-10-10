require "sinatra"
require "sinatra/link_header"
require "sinatra/reloader" if development?

enable :static

get "/" do
  @activities =
  [{"name" => "Visit art museum", "category" => "Cultural", "city" => "Nantes","img url" => "\img\Musee.png", "duration" => 120, "number of participants" => 5, "price (in EUR)" => 30},
  {"name" => "Diner dans les arbres", "category" => "Food", "city" => "Nantes","img" => "\img\arbre.png","duration" => 180, "number of participants" => 2, "price (in EUR)" => 100},
  {"name" => "Escape Game", "category" => "Adventure", "city" => "Paris","img" => "\img\escape.jpg","duration" => 60, "number of participants" => 10, "price (in EUR)" => 50}
  ]
  erb :index
end
