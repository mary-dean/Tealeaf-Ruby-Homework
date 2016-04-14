# Mary Dean
# 9/5/2014
# Pre-course Homework 4: FLOW CONTROL
# Tealeaf Academy Programming in Ruby

puts "9/5/2014"
puts "Mary Dean\n\nHomework: FLOW CONTROL"

divider = "-------------------------------------"
puts divider 
puts "Exercise 1: true or false"
puts divider
puts "1. This should be false"
puts (32*4)>=129
puts "2. This should be false"
puts false != !true
puts "3. This should be ... true... no, false"
puts true == 4
puts "4. This should be true"
puts false ==(847 == '874')
puts "5. This should be true"
puts (!true || (!(100/5)==20) || ((328/4) == 82)) || false

#*******************************************************************
puts divider 
puts "Exercise 2: Capitalize conditionally"
puts divider
def cappy(s)
	s.length > 10 ? s.upcase! : s
end
puts cappy("this is a test of a long string")
puts cappy("me2 short")
puts "\nI am so proud because I used the ternary operator!"


#*******************************************************************
puts divider 
puts "Exercise 3: Range finder"
puts divider
puts "Enter a number between 1 and 100"
n = gets.chomp.to_i
# I am having trouble with this. I tried
# when(1..25)===n but that didn't work
# when(1..25).include?(n) but that didn't work either
# I think include is only for strings? 
#OH NO!  It worked when I changed it from range = case n to plain range = case
#What is the n doing in that case?
#Now all of these work
puts range = case 
when n.between?(1,25) then "Your number is between 1 and 25"
when (26..50).include?(n) then "Your number is between 26 and 50"
when (51..75)===n then "Your number is between 51 and 75"
when n >= 76 && n<=100 then "Your number is between 76 and 100" 
else "Your number is out of range"
end
puts "\nNow I am going to do it more efficiently"
puts "and also make it into a method\n\n"
def get_range(n)
	case n
	when 1..25 then "Your number is between 1 and 25"
	when 26..50 then "Your number is between 26 and 50"
	when 51..75 then "Your number is between 51 and 75"
	when 76..100 then "Your number is between 76 and 100" 
	else "Your number is out of range"
	end
end

puts get_range(n) 
#*******************************************************************
puts divider 
puts "Exercise 4: More Ifs and Thens"
puts divider
puts "1. I think this will say FALSE"
'4' == 4 ? puts("TRUE") : puts("FALSE")
#That is interesting, I guess I think of assigning values to variables
#with a ternary operator but I don't think of running a block of code like puts
puts "2. I think this will say 'Did you get it right?'"
x =2
if((x*3)/2) == (4+4-x-3)
	puts "Did you get it right?"
else
	puts "Did you?"
end
puts "3. I think this will say 'Alright now!'"
y = 9
   x = 10
   if (x + 1) <= (y)
     puts "Alright."
   elsif (x + 1) >= (y)
     puts "Alright now!"
   elsif (y + 1) == x
     puts "ALRIGHT NOW!"
   else
     puts "Alrighty!"
   end
#*******************************************************************
puts divider 
puts "Exercise 5: I already used a case statement above"
puts divider
#*******************************************************************
puts divider 
puts "Exercise 6: Error message"
puts divider
puts "You just need another end to finish your def"


