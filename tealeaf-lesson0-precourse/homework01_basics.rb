# Mary Dean
# 9/1/2014
# Pre-course Homework: THE BASICS
# Tealeaf Academy Programming in Ruby

#       * * * * * * * * * 1 * * * * * * * * * 
puts "9/1/2014\nMary Dean\n\nHomework: THE BASICS"
divider = "-------------------------------------"
puts divider
puts "Exercise 1: Concatenation/Interpolation"
puts divider

# (1.) Using plus signs

puts "Mary" + " " + "Dean"

#(2.) Using plus signs and variables
a = 'Mary'
b = ' '
c = 'Dean'
x = 'My name is '
puts x + a + b + c

#(3.) Using string interpolation
puts "And this is #{a} #{c}'s first homework assignment."

#       * * * * * * * * * 2 * * * * * * * * * 

puts divider
puts "Exercise 2: Parse a four-digit number"
puts divider

n = rand(1000..9999)

puts "Here is a random number: " + n.to_s
puts "The thousands number is: #{n/1000}"
puts "The hundreds number is:  #{(n/100)%10}"
puts "The tens value is:  #{(n%100)/10}"
puts "The ones value is:  #{(n%100)%10}"
puts "Yay!"
#QUESTION: I don't understand why this gave me errors.'
#puts "The thousands number is: "  + (n/1000).to_s
#because it worked in IRB
#
#ANSWER FROM THE BOOK:
th = n/1000
h = n % 1000 / 100
t = n % 1000 % 100 /10
o = n % 1000 % 100 % 10
reconstituted_num = (th.to_s + h.to_s + t.to_s + o.to_s).to_i
puts "Here is the book's answer: #{reconstituted_num}"
puts "Do both solutions work? #{n==reconstituted_num}"

#       * * * * * * * * * 3 * * * * * * * * * 

puts divider
puts "Exercise 3: Movie date HASH"
puts divider
movie_list = {:Tarzan => "1918", :"Creature from the Black Lagoon" => "1954", :"The Blob" => "1958", :Bambi => "1942"}
puts "Here is a list of movies:"
movie_list.each do |x, y|
  print "  * "
  puts x
end
puts "\nAnd here are the years they were released:"
movie_list.each do |x, y| 
  print "    "
  puts y
end
# Here is the teacher's hash, I like this format better"
movies = { jaws: 1975,
           anchorman: 2004,
           man_of_steel: 2013,
           a_beautiful_mind: 2001,
           the_evil_dead: 1981 }

# NOTE TO SELF:
# If a movie has no spaces, Ruby doesn't seem to care
# if I use the key :Tarzan or :"Tarzan"
#
# QUESTION: should four-digit year be string or integer? 
# Oh, I see the teacher used integers. I guess that makes sense

# NOTE TO SELF: 
# It's not FOR each, it's just EACH by itself!

#       * * * * * * * * * 4 * * * * * * * * * 

puts divider
puts "Exercise 4: Movie date ARRAY"
puts divider

m = movie_list
movie_date_array = [m[:Tarzan],m[:"Creature from the Black Lagoon"],m[:"The Blob"],m[:Bambi]]
puts movie_date_array

puts "\nThere must be a more elegant way to do this..."
puts "Here is a nifty .keys method"
puts m.keys

puts "\nI guessed there would be a corresponding .values method "
puts "and I was right! Ruby is so cool."
puts m.values

#       * * * * * * * * * 5 * * * * * * * * * 

puts divider
puts "Exercise 5: Factorials of 5, 6, 7, and 8"
puts divider
f5 = 5 * 4 * 3 * 2 * 1
f6 = 6 * f5
f7 = 7 * f6
f8 = 8 * f7
puts "5! = #{f5}"
puts "6! = #{f6}"
puts "7! = #{f7}"
puts "8! = #{f8}"

#       * * * * * * * * * 6 * * * * * * * * * 

puts divider
puts "Exercise 6: Square some floats"
puts divider
# rand by itself generates a long decimal number
# so I am trying to shortening it
3.times do
  x = (rand * 100).round(2)
  y = (x ** 2).round(4)
  puts "#{x} squared is #{y}"
end

#       * * * * * * * * * 7 * * * * * * * * * 

puts divider
puts "Exercise 7: Examine an error message"
puts divider
# I want to learn to display large amounts of text
# without using puts on every line, so I learned about Heredocs
# I guess you can use any "end marker" (most use EOS or EOT)
# The key is that the end marker has to be on line by itself
# as first thing on line
error_msg = <<END_MARKER 
SyntaxError: (irb):2: syntax error, unexpected ')', expecting '}'
    from /usr/local/rvm/rubies/ruby-2.0.0-rc2/bin/irb:16:in `<main>'
END_MARKER
puts "Here is the original error message, displayed using Heredocs:\n\n #{error_msg}"
puts "\nI guess it just means you didn't close your hash or block properly"