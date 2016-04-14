# Mary Dean
# 9/5/2014
# Pre-course Homework 5: LOOPS and ITERATION
# Tealeaf Academy Programming in Ruby

puts "9/5/2014"
puts "Mary Dean\n\nHomework: LOOPS AND ITERATION"

divider = "-------------------------------------"
# *********************************************
puts divider 
puts "Exercise 1: using EACH"
puts divider
x = [1,2,3,4,5]
puts "Here is my array: #{x}"
puts "\nRunning it through my processer now:"
result = x.each do |a|
	puts a+1
end
puts "\nNow I will present the result:"
puts result
puts "As expected, the result is the original array"
# *********************************************
puts divider 
puts "Exercise 2: WHILE loop"
puts divider
# I will make it a DO WHILE loop so they get insulted at least once
# Question: later I tried to remove my array of insults to use elsewhere
# in this program. But then my insult_me method couldn't find it.
# I thought variables were accessible TO methods, just not FROM methods???
def insult_me
	insults = ["stupid", "dumb", "icky", "a jerk", "unpleasant", "mean", "useless",
		"belligerant", "unknowledgable", "dirty", "insipid", "doglike", "puny-brained",
		"knuckle-headed", "stinky", "dull", "blubbery","porcine","untrustworthy"]
	counter = 0
	puts "I am going to insult you until you say STOP\n\n"
	begin
  		puts "You are #{insults[rand(0..insults.length-1)]}!"
  		counter = counter + 1
  		puts "\nPress Enter to continue, or type STOP to stop."
  		response = gets.chomp
  	end while response.upcase != "STOP"
  	puts "\nYou received #{counter} insults."
  	puts "That will be #{counter} dollars, please."
end

insult_me

# *********************************************
puts divider 
puts "Exercise 3: each_with_index!"
puts divider
todo = ["Buy dog food", "Make doctor appointment", "Print report", "Paint stairs",
	"Get lien release notarized"]
todo.each_with_index {| item, num | 
	puts "#{num + 1}.  #{item}"
	}
puts "That's a handy list!"
puts "\nHere's the teacher's answer"
top_five_games = ["mario brothers",
                  "excite bike",
                  "ring king",
                  "castlevania",
                  "double dragon"]

top_five_games.each_with_index do | game, index |
  puts "#{index + 1}. #{game}"
end
puts "\nI need to remember to format my arrays that way"

# *********************************************
puts divider 
puts "Exercise 3: countdown using recursion"
puts divider

#Here is my first try. Hey I think it worked!
#My only mistake was saying: if num == 0 for endpoint
#But if num <= 0 is better to account for possible negative
#starting numbers
def countdown(num)
	if num <= 0		#I had num == 0
		puts num
		puts "BLAST-OFF!!!!"
	else
		puts num
		countdown(num-1)
	end
end
countdown(10)



