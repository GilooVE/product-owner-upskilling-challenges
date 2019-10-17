require "sinatra"
require "sinatra/json"
require "sinatra/link_header"
require "sinatra/namespace"
require "sinatra/reloader" if development?

require "sqlite3"

enable :static

DB_PATH = File.join(__dir__, "db/team_building.sqlite")
DB      = SQLite3::Database.new(DB_PATH)
DB.results_as_hash = true

get "/" do
  json "name" => "Team Building API", "status" => "Running"
end

namespace "/v1" do
  get '/activities' do
    activities = DB.execute("select * from activities order by name asc;")
    json "activities" => activities
  end

  get "/activities/:id" do
    activities = DB.execute(
      "select * from activities
      where id = #{params["id"]};")
    json "activities" => activities
  end
end

namespace "/v2" do
  get "/activities/:id" do
    activities = DB.execute("select * from activities
      where id = #{params["id"]};")
    json "activities" => activities
  end


  #get "/activities" do
  #  if params[:city] !=nil
  #      activities = DB.execute(
  #        "select * from activities
  #        where city = '#{params[:city]}';")
  #  elsif params[:category] !=nil
  #      activities = DB.execute(
  #        "select * from activities
  #        where category = '#{params[:category]}';")
  #  elsif params[:search] !=nil
  #      activities = DB.execute(
  #        "select * from activities
  #        where name like '%#{params[:search]}';")
  #  else
  #      activities = DB.execute("select * from activities order by name asc;")
  #  end
  #  json "activities" => activities
  #end


#---------------------

   # constuire un tableau vide de filtres
   # si le user filtre par city, rajouter la condition SQL dans le tabeau de filtres
   # (faire de meme pour category et search)
   # construire la base de la query et stocker ca dans une variable
   # construire la requete SQL finale
   # 2 cas:
   # 1. on a pas de filtres
   # 2. on a des filtres
   # executer la query
   # retourner le json

  get "/activities" do
    params_table = []

    if params[:city] != nil
      params_table << "city ='#{params[:city]}'"
    end

    if params[:category] != nil
      params_table << "category ='#{params[:category]}'"
    end

    if params[:search] != nil
      params_table << "name like '%#{params[:search]}%'"
    end

    query = "select * from activities"

    if !params_table.empty?
      query = query + " where "
      query = query + params_table.join(" and ")
    end

    query << " order by name asc"

    activities = DB.execute(query)
    json "activities" => activities
  end


end



















namespace "/doc" do
  get { erb :"doc/index" }

  namespace "/v1" do
    get "/activities" do
      erb :"doc/v1/activities"
    end
  end

  namespace "/v2" do
    get "/activities" do
      erb :"doc/v2/activities"
    end
  end
end
