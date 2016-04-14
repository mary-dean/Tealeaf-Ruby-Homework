# Mary Dean
# 9/5/2014
# Pre-course Homework 6: ARRAYS
# Tealeaf Academy Programming in Ruby

puts "9/5/2014"
puts "Mary Dean\n\nHomework: ARRAYS"

divider = "-------------------------------------"
# *********************************************
puts divider 
puts "Exercise 1: Included in array?"
puts divider
arr = [1,3,5,7,9,11]
puts "Enter a number and I will tell you if it is in my array:"
number = gets.chomp.to_i
puts "#{number} #{arr.include?(number) ? "IS" : "IS NOT"} in the array."
# Yay I used the ternary operator again
# *********************************************
puts divider 
puts "Exercise 2: Multiplying arrays"
puts divider
arr = ["b", "a"]
arr = arr.product(Array(1..3))
#What the heck? Is a range an array? 
#Oh, I see, we are calling the Array class and actually creating an array on the fly.
puts "Here is the array after we multiplied it\n\n"
# [["b", 1], ["b", 2], ["b", 3], ["a", 1], ["a", 2], ["a", 3]]
print arr
arr.first.delete(arr.first.last)
#This is tricky. Because it's the delete method, we know we are 
#deleting by value. So the value is the last element of the first array 
#in the 2-D array we have created. Will it delete All the b's? 
#No I was wrong
puts "\n\nThis is the final result\n\n"
print arr
# [["b"], ["b", 2], ["b", 3], ["a", 1], ["a", 2], ["a", 3]]
#OK, so arr.first limited us to the very first element, which was the array ["b",1]
#So all the action will happen only within that small array.
#So arr.first.last means the last element in the first array, which is 1
puts "\n\nThat was tricky. arr.first.last gives us 1"
puts "so we deleted the 1 from arr.first. OK, I get it.\n\n"
puts "In the second example, we get a completely different array from 
one subtle difference. Instead of arr.product(Array(1..3)) we ask for 
arr.product([Array(1..3)]) -- in brackets ==which gives us:\n\n"
arr = ["b", "a"].product([Array(1..3)])
print arr
#  [["b", [1, 2, 3]], ["a", [1, 2, 3]]]
puts "\n\nOk, so now arr.first.last is [1,2,3] so we should 
end up with 'b' by itself in first array element\n\n"
arr.first.delete(arr.first.last)
print arr
puts "\n\nYay, I was correct\n\n"
# *********************************************
puts divider 
puts "Exercise 3: Selecting an item from 2-D array"
puts divider
puts "I want to snatch the word 'example' from this array"
print arr = [["test", "hello", "world"],["example", "mem"]]
puts "\n\nI will just ask for arr[1][arr[0]]"
the_thing_I_want = arr[1][0]
puts "Drum roll please. . . "
puts the_thing_I_want
puts "I did it!"
# *********************************************
puts divider 
puts "Exercise 4: Array methods"
puts divider
arr = [15, 7, 18, 5, 12, 8, 5, 1]
print "Here is another array: " 
print(arr)
puts "\n\nAnother tricky one. .index(obj) gives you index of that obj"
puts "\nSo arr.index(5) should give you 3"
puts arr.index(5)
puts "Yes, I was correct"
puts "But what if there are multiples? I will try it by adding several 5s:"
arr2 = [15, 7, 18, 5, 12, 8, 5, 1,5,5,5]
print arr2
puts "\n"
puts arr2.index(5)
puts "Nope, I just get a single 3, so it only finds the first occurence"
puts "\n\nThe next one is a trick. arr.index[5] gives an error"
puts " undefined method `[]' for #<Enumerator"
puts "\n"
puts "Finally, arr[5] should give us 8"
puts arr[5]
puts "And I am right"
# *********************************************
puts divider 
puts "Exercise 5: Strings are arrays of characters!"
puts divider
string = "Welcome to Tealeaf Academy!"
puts a = string[6]
puts b = string[11]
puts c = string[19]
puts "That's cool. It looks like a string is inherently an array"
# *********************************************
puts divider 
puts "Exercise 6: Error message"
puts divider
puts "The problem is that an index has to be an integer"
puts "You could look up the index by saying names.index('margaret')"
puts "so the whole thing would be: names[names.index('margaret')] = 'jody'"
puts "\n"
names = ['bob', 'joe', 'susan', 'margaret']
print "Original list: "
print names
names[names.index('margaret')] = 'jody'
puts "\n"
print "New list: "
print names
puts "\n"
puts "Holy Toledo, I nailed it!"

# *********************************************
puts divider 
puts "Exercise 7: Using MAP or COLLECT"
puts divider
puts "\nOriginal array:"
p array1 = [1,2,3,4,5,6,7,8,9,10]
puts "\n"
puts "\nDerivative array, using MAP:"
p array2 = array1.map {|x| x+2 }
puts "\n"
puts "\nAnd one more time using COLLECT on the 2nd array"
p array2.map {|x| x+2 }
puts "\nAnd finally I am done with this homework."





