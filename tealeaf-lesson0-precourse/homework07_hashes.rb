# Mary Dean
# 9/5/2014
# Pre-course Homework 7: HASHES
# Tealeaf Academy Programming in Ruby

puts "9/5/2014"
puts "Mary Dean\n\nHomework: HASHES"
divider = "-------------------------------------"
# *********************************************
puts divider 
puts "Exercise 1: Rearrange your relatives"
puts divider

family = {  uncles: ["bob", "joe", "steve"],
            sisters: ["jane", "jill", "beth"],
            brothers: ["frank","rob","david"],
            aunts: ["mary","sally","susan"]
          }
#Here's the trick!  Symbols don't need quotation marks!!!
#I was trying this: (k == ":sisters") || (k == ":brothers") 

#I used values to get rid of the sister/brother labels
#and then flatten to combine them into one array

immediate_family = family.select {|k,v| (k == :sisters || k == :brothers)}.values.flatten
puts "These are my brothers and sisters:\n #{immediate_family}"
puts "\n\n"
puts "Now I am going to try to print everyone as a table\n\n"

@f = family
def print_family
row1 = "  #{@f.keys[0]}     #{@f.keys[1]}     #{@f.keys[2]}     #{@f.keys[3]}"
row2 = "  #{@f.values[0][0]}        #{@f.values[1][0]}        #{@f.values[2][0]}        #{@f.values[3][0]}"
row3 = "  #{@f.values[0][1]}        #{@f.values[1][1]}        #{@f.values[2][1]}          #{@f.values[3][1]}"
row4 = "  #{@f.values[0][2]}      #{@f.values[1][2]}        #{@f.values[2][2]}        #{@f.values[3][2]}"
puts "                  MY FAMILY                 "
puts "  ------------------------------------------"
puts row1
puts "  ------------------------------------------"
puts row2
puts row3
puts row4
puts "\n\n\n"
end
print_family
puts "(There must be easier ways to do this!)\n\n\n"

#puts "Here is an approach using slice"
#sibs.each_slice(2) do |a,b|
 #       puts "#{a}   #{b} \n\n"
  #    end

# *********************************************
puts divider 
puts "Exercise 2: Merge your hash"
puts divider
corpse1 = {:height=>'6 ft', :weight=>'160lbs', :hair=>'brown', :liver=>'diseased'}
corpse2 = {:eyes=>'blue', :height=>'5 ft', :hair=>'curly', :gait=>'slow'}

puts "Corpse 1:"
puts corpse1
puts "Corpse 2:"
puts corpse2
puts "\n\n"
puts " . . . . . . . . . . . . . . . "
puts "    My Frankenstein Monster"
puts " . . . . . . . . . . . . . . . "
puts corpse1.merge(corpse2).flatten
puts "\n\n\n"


# *********************************************
puts divider 
puts "Exercise 3: Loop through a hash"
puts divider

frankenstein = corpse1.merge!(corpse2)
puts "\nKEYS:"
frankenstein.keys.each { |k| puts k }
puts "\nVALUES:"
frankenstein.values.each { |v| puts v }
puts "\nBOTH:"
frankenstein.each { |k, v | puts "His #{k} is #{v}."}



# *********************************************
puts divider 
puts "Exercise 4: Access one item"
puts divider
puts "HASH:"
puts person = {name: 'Bob', occupation: 'web developer', hobbies: 'painting'}
puts "\n"
puts "To access name, say: person.fetch(:name) or person[:name]"
puts "\nUsing FETCH:"
puts person.fetch(:name)
puts "\nAccessing by KEY:"
puts person[:name]
puts "\n"

# *********************************************
# EEEK!  Important lesson here
# .include? is for ARRAYS
# .has_value? is for HASHES
puts divider 
puts "Exercise 5: Look for a value"
puts divider
puts "\nHere is my family again"
print_family

puts "Wah? This is what I had to do to get jane to be included!\n"
puts "@f.to_a.flatten.include?(\"jane\")"
puts @f.to_a.flatten.include?("jane")
puts "\n@f.to_a.flatten.include?(\"bozo\")"
puts @f.to_a.flatten.include?("bozo")
puts "\nLet's go back to frankenstein to use has_value?"
puts "frankenstein.has_value?(\"curly\")"
puts frankenstein.has_value?("curly")
puts "\n"


# *********************************************
puts divider 
puts "Exercise 6: Anagrams"
puts divider
# The key here, which didn't occur to me, is to sort the words"
# That allows you to compare them easily
# *********************************************
words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

sorted_words = words.map {|w| w.split("").sort.join}

puts "SORTED WORDS:"
puts sorted_words

key_list = sorted_words.uniq!

puts "\nUNIQUE KEYS"
puts key_list

index_list = []


sorted_words.map.with_index do |s,i|
	key_list.each do |w|
		if s == w
			index_list.push(i)
		end
	end
end

puts "\nTHIS IS WHERE I GAVE UP"
puts "Trying to generate a list of indexes that would tell me where the words were"
print index_list
puts "\n\n"

puts "Here is the teacher's answer:"
result = {}

words.each do |word|
  key = word.split('').sort.join
  if result.has_key?(key)
    result[key].push(word)
  else
    result[key] = [word]
  end
end

result.each do |k, v|
  puts "------"
  p v
end

puts "\nI will have to go back and study that"

puts divider 
puts "Exercise 7: Old style new style"
puts divider

puts "Since x is a variable a string will be used for the key to the second hash"
x = "hi there"
puts "\nFirst hash:"
my_hash = {x: "some value"}
puts my_hash
puts "\nSecond hash:"
my_hash2 = {x => "some value"}
puts my_hash2
puts "\n"



# *********************************************
puts divider 
puts "Exercise 8: Error message"
puts divider

puts "This error is happening because you tried to use 
the method .keys on an array rather than a hash"

