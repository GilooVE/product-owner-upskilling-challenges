activities = [{"name" => "Visit art museum", "category" => "Cultural", "city" => "Nantes","duration" => 120, "number of participants" => 5, "price (in EUR)" => 30},
  {"name" => "Diner dans les arbres", "category" => "Food", "city" => "Nantes","duration" => 180, "number of participants" => 2, "price (in EUR)" => 100},
  {"name" => "Escape Game", "category" => "Adventure", "city" => "Paris","duration" => 60, "number of participants" => 10, "price (in EUR)" => 50}
]
activities.each do |activity|
  puts "#{activity["name"]} [#{activity["category"].upcase}]"
  puts "Located in #{activity["city"]}"
  puts "Duration of #{activity["duration"]} minutes"
  puts "For #{activity["number of participants"]} participants"
  puts "Charged #{activity["price (in EUR)"]} €"
  puts "---"
end
