# Mary Dean
# 9/6/2014
# Pre-course Homework 8: MISC TOPICS
# Tealeaf Academy Programming in Ruby

puts "9/6/2014"
puts "Mary Dean\n\nHomework: MISC TOPICS"
divider = "-------------------------------------"
# *********************************************
puts divider 
puts "Exercise 1: Find words that contain 'lab'"
puts divider
puts "\nFirst figure out the regex string"
puts "I assume it will just be /lab/.match('word')"
puts "\nCreate an array of words"
word_list = ["laboratory", "experiment", "Pans Labyrinth", "elaborate", "polar bear"]
p word_list
final_list = []
word_list.each do |word|
if /lab/.match(word)
	final_list << word
  end
end

puts "\nHere are my finalists"
p final_list
puts "\nI missed Pans Labyrinth. So I will adjust the regex"
puts "Actually, it would be easier to just lowercase everything"
final_list2 = []
word_list.each do |word|
if /lab/.match(word.downcase)
	final_list2<<word
end
end
puts "\nHere are my new finalists"
p final_list2
puts "\nYay, success.\n\n"

# *********************************************
puts divider 
puts "Exercise 2: Blocks"
puts divider
puts "\nDon't you have to say block.call?\n\n"
def execute(&block)
  block.call
end
execute { puts "Hello from inside the execute method!" }
puts "\nYes, I was right. Now it works\n\n"

# *********************************************
puts divider 
puts "Exercise 3: Exception handling"
puts divider
puts "\nI SAY: Exception handling is a way to capture errors"
puts "and wrestle them down before they blow up the building\n\n"
long_string = "Exception handling is a structure used to handle the possibility of an error occurring in a program. It is a way of handling the error by changing the flow of control without exiting the program entirely."
width = 40
broken_up_string = long_string.scan(/\S.{0,#{width-2}}\S(?=\s|$)|\S+/)
puts broken_up_string
puts "\nI used a regex to break up that paragraph!"

# *********************************************
puts divider 
puts "Exercise 4: Fix #2"
puts divider
puts "I already did that"


# *********************************************
puts divider 
puts "Exercise 5: "
puts divider

puts "Because you didn't use an ampersand"
