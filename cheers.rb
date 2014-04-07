# my_array = ["foo", "bar", "grille"]

# my_array.each do |item|
  # puts item.capitalize
# end

vowels = ["a", "e", "i", "o", "u"]
puts "What's your name?"
name = gets.chomp
# puts "Your name is #{name}"

name.each_char do |character, index|
  if character == name[0]
    puts "Give me an... #{character.capitalize}"
  elsif vowels.include? character
    puts "Give me an... #{character.capitalize}"
  else
    puts "Give me a... #{character.capitalize}"
  end
end
puts "#{name.upcase}'s just GRAND!"


