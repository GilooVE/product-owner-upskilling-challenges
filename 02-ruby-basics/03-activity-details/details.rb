activity = {"name" => "Visit art museum", "category" => "Cultural", "city" => "Nantes","duration" => "3 hours", "number of participants" => "5", "price (in EUR)" => "30"}

puts "#{activity["name"]} [#{activity["category"].upcase}]"
puts "Located in #{activity["city"]}"
puts "Duration of #{activity["duration"]}"
puts "For #{activity["number of participants"]} participants"
puts "Charged #{activity["price (in EUR)"]}€"
