# Mary Dean
# 9/3/2014
# Pre-course Homework 2: VARIABLES
# Tealeaf Academy Programming in Ruby

puts "9/3/2014\nMary Dean\n\nHomework: VARIABLES"
divider = "-------------------------------------"
puts divider
puts "Exercise 1-4: NAME and AGE"
puts divider
puts "What is your name, Sweetie? (first and last)"
name = gets.chomp
puts "\nOMG, did you know that #{name} is my all-time favorite name?
\nSo, #{name}, how old are you?"
age = gets.chomp.to_i
x=10
puts ""
4.times do
  puts "Wow! In #{x} years you will be #{age+x}"
  x += 10
end
puts "\nI feel like repeating your name again and again. May I? (y/n)"
agrees = gets.chomp

# Notice that I DON'T need 'do' OR '{' for if statement !!!

# I wanted to draw an X but too much work
if agrees.upcase == 'Y'
  spaces = 10
  while spaces > 0 
    puts "#{name}#{' '*spaces}#{name}"
    spaces = spaces -1
end
while spaces < 10
    puts "#{name}#{' '*spaces}#{name}"
        spaces = spaces +1
end
end
#REMEMBER YOU DON'T NEED THE DO IF YOU USE THE BRACKET!!!

fname = name.split.first
lname = name.split.last
puts "\n\nPlease confirm that your first name is '#{fname}' by pressing Enter.
If not, please correct it here:" 
x = gets.chomp
puts "\nAnd your LAST name is '#{lname}', right? If so, press Enter. 
If not, correct it here:"
y = gets.chomp

  #NOTE: this didn't work: 
  #name = x unless x.nil?

#This seems to work
if !x.empty? 
  fname = x
end
if !y.empty? 
  lname = y
end
fullname = fname + " " + lname
puts divider
puts divider
puts "\nSo your full name is '#{fullname}'"
msg = case
when name == fullname
  "\nAt least we got that settled."
else
  "\nWhy did you LIE to me, #{fullname}? You told me your name was #{name}!"
end
puts msg
puts
puts divider
puts divider
puts
puts "Answer to question 5: It will give 3, then it will give error
Because x was defined inside the block."
puts
puts "Answer to question 6: It means you haven't defined shoes in
the current scope"



