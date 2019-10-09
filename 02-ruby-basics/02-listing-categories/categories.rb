# TODO: your code goes here
categories = ["Adventure", "Sport", "Visits", "Workshops", "Cultural", "Food"]

puts "Please, add a new categorie"
extra_categorie = gets.chomp.capitalize

categories << extra_categorie
categories = categories.sort
categories.each do |category|
 puts "- #{category}"
end
puts "Total: #{categories.count}"
