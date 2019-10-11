require "json"
require "rest-client"

puts "What is the role of the users you're looking for? (e.g. Figgo - Manager)"
role = gets.chomp # asks user to type something in the Terminal

puts "Ok got it! Let's search for the users..."


url = "https://wagon.ilucca-demo.net/api/v3/users/"

response = RestClient.get(url, "params" => {"fields" => "lastName, firstName, jobTitle","rolePrincipal.name" => "#{role}"}, "Authorization" => "Lucca application=18afcfb8-697b-4742-b726-418269485cee")
user_roles = JSON.parse(response.body)
#p user_roles

puts "Total : 5 people found"

user_role = user_roles["data"]["items"][0]
  user_role.each do |key, value|
    puts "#{value}"
  end
 puts "---"
 user_role = user_roles["data"]["items"][1]
  user_role.each do |key, value|
    puts "#{value}"
  end
 puts "---"
 user_role = user_roles["data"]["items"][2]
  user_role.each do |key, value|
    puts "#{value}"
  end
 puts "---"
 user_role = user_roles["data"]["items"][3]
 user_role.each do |key, value|
   puts "#{value}"
 end
puts "---"
user_role = user_roles["data"]["items"][4]
  user_role.each do |key, value|
    puts "#{value}"
  end
 puts "---"


#https://wagon.ilucca-demo.net/api/v3/users?fields=lastname, firstname,jobtitle&rolePrincipal.name=Figgo - Manager
