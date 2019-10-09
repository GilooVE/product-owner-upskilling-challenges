require "sinatra"
require "sinatra/link_header"
require "sinatra/reloader" if development?

enable :static

get "/" do
  @activities =
  [{"name" => "Visit art museum", "category" => "Cultural", "city" => "Nantes","duration" => 120, "number of participants" => 5, "price (in EUR)" => 30},
  {"name" => "Diner dans les arbres", "category" => "Food", "city" => "Nantes","duration" => 180, "number of participants" => 2, "price (in EUR)" => 100},
  {"name" => "Escape Game", "category" => "Adventure", "city" => "Paris","duration" => 60, "number of participants" => 10, "price (in EUR)" => 50}
  ]
  erb :index
end
