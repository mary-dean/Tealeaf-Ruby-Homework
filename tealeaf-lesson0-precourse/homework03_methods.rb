# Mary Dean
# 9/4/2014
# Pre-course Homework 3: METHODS
# Tealeaf Academy Programming in Ruby

puts "9/4/2014"
puts "Mary Dean\n\nHomework: METHODS"

divider = "-------------------------------------"
dots = ". . . . . . . . . . . . . ."
def pause_for_applause
	puts "... Press Enter to continue..."
	gets
end

puts divider
puts "Exercise 1: GREETING METHODS"
puts divider
puts "\n"	#NOTE THIS HAS TO BE IN QUOTES
#Question: The output is not in the order I expected
#When processing an interpolated string, I guess it must do the 
#calculations first and then put the string together

def get_name
	puts "Tell us your name\n"
	gets.chomp		#SINCE IT'S LAST THING DON'T NEED TO NAME IT OR RETURN IT
end

def greeting
  puts "\nHey, Everyone! I want you to meet my friend #{get_name}!\n\n"
end

#Question: is there any way to assign a variable name to this person here?

greeting

def greet_back(n)
	  options = ["Howdy, I'm #{n}", 
	  	"Hello, I'm #{n}", 
	  	"#{n} here", 
	  	"Nice to meet you, you can call me #{n}"]
	  choice = rand(0..options.length-1)
	  spaces = rand(1..20)
 	  puts "#{' '*spaces} #{options[choice]}!"
 	end

#NOTE: .length GIVES THE CORRECT LENGTH. I THOUGHT IT WOULD
#COUNT FROM ZERO

#ALSO, THIS IS WEIRD. MY LITTLE SPACES TRICK ONLY WORKS
#IF ' ' COMES FIRST.  "#{' '*spaces}"  but not  "#{spaces*' '}"

names = ["Susie", "Ralph", "Snoopy", "Peg"]

names.each do |name| 
	greet_back(name)
	puts
end
# *************LEARNING TO PAUSE ******************
#I wanted to pause until the user pressed a key like in a bat file
#but I only found a timer...
#sleep(5)
#I guess I can say


pause_for_applause
#*************************************
puts divider
puts "Here is another interesting behavior"
puts "A method and a variable with same name"
puts divider

def say_hello
	puts "Hola, I am a method"
end

puts "\n                say_hello (calling the method)"
say_hello		#says "Hola"

puts "\n               ... now I am assigning a variable to say_hello"
say_hello = "Bon Jour, I am a variable"

puts "               say_hello (calling the method again)"
say_hello	#DOES NOTHING... why doesn't it call the method?
puts "               (nothing happened. Why didn't it call method?)"

puts "\n               puts say_hello (prints the variable)"
puts say_hello	#says "Bon Jour"

puts "\n               say_hello()     -- explicitly calling the method"
say_hello()		#explicitly calling a method... says "Hola"
puts "\n               p say_hello (printing the string with p)"
p say_hello		#says Bon Jour with no quotes

msg = <<EOS 
I guess I thought methods would have priority but it 
makes sense that variables would have priority since
you can explicitly call methods
EOS
puts "\n"
puts msg
puts "\n\n\n"
#Question why can't I use EOS in puts statement?

pause_for_applause

puts divider
puts "Onward to Exercise 2!"
puts divider
puts "x=2 by itself returns 2 in irb but nothing here"
x = 2
puts dots
puts "puts x = 2 prints the number 2, but the value is nil, right?"
puts x = 2
puts dots
puts "p yourname = \"Joe\" will give you \"Joe\" in quotes"
puts "Is it still assigning a variable even inside a puts??? "
p yourname = "Joe"
puts "Hello, #{yourname}"
puts "Woah! It worked? So ... how is that working?"
puts dots
puts "four = \"four\" will give you false if you puts it"
four = "four"
puts "No, I was wrong about that. Of course, four is a variable name!"
puts four = "four"
puts dots
puts "print something = \"nothing\" will give you ... nothing"
print something = "nothing"
puts "\nInteresting, the value of something is #{something}"
puts "\n" + dots

pause_for_applause

puts divider
puts "Exercise 3:  MULTIPLYING 10 RANDOM PAIRS OF NUMBERS"
puts divider

def multiply(x,y)
  x*y
end

10.times do 
	puts multiply rand(0..99), rand(0..99)
end

#NOTE TO SELF: YOU CAN'T USE .15 WITHOUT THE 0.15


puts divider
puts "Exercise 4: SCREAM"
puts divider

def scream(words)
	words = words + "!!!!"
	return
	puts words
end

puts "I predict scream will be mute"
scream "Yippeeee"
puts "and I am right"
puts "\n\n"


puts divider
puts "Exercise 5: SCREAM AGAIN"
puts divider

def scream2(words)
	words = words + "!!!!"
	puts words
end

scream2 "Yippeeee"

pause_for_applause

puts divider
puts "Exercise 6: ERROR MESSAGE"
puts divider
puts "It just means you didn't pass it the two arguments it needed"
