ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
puts ages.key?('Spot')

munsters_description = "The Munsters are creepy in a good way."

puts munsters_description.swapcase
puts munsters_description.capitalize
puts munsters_description.downcase
puts munsters_description.upcase

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
additional_ages = { "Marilyn" => 22, "Spot" => 237 }
p ages.update additional_ages

advice = "Few things in life are as important as house training your pet dinosaur."
p advice.match? 'dino'

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
p flintstones.append('Dino')

p flintstones.append('Dino', 'Hoppy')

advice = "Few things in life are as important as house training your pet dinosaur."
p advice.slice!("Few things in life are as important as ")
p advice

p "The Flintstones Rock!".count('t')

title = "Flintstone Family Members"
p title.center(40)