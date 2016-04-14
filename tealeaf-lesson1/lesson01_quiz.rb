#9/17/2014
#Mary Dean
# Quiz

# 1
puts
puts "---------------------"
puts "Question 1:"
puts "---------------------"
puts "I believe the value of a will still be 1 because I THINK that 
re-assigning b with the '=' assignment operator breaks the link that 
it formerly had with variable a."

a=1
b=a
b=3

puts "\nAm I correct? a = #{a}"
puts
puts "Yes, I am correct."

# 2
puts
puts "---------------------"
puts "Question 2:"
puts "---------------------"
puts "An array is an ordered list of elements, in square brackets, 
a hash is a like a dictionary with keys and values, and is in curly brackets."

# 3
puts 
puts "---------------------"
puts "Question 3:"
puts "---------------------"
puts "The answer should be [1,2,3,3,], [1,2,3,3] and then [1,2,3]"
puts
puts "Am I right?"
arr = [1,2,3,3]
puts "arr is #{arr}"
puts "[1,2,3,3].uniq is #{[1,2,3,3].uniq}"
puts "[1,2,3,3].uniq! is #{[1,2,3,3].uniq!}"
puts
puts "Oops, I misspoke. .uniq works for display, it just doesn't
permanently alter the underlying array"


# 4
puts
puts "---------------------"
puts "Question 4:"
puts "---------------------"
puts "Map returns a new, transformed array"
puts "An example would be running a list of names through a capitalization block"
puts 
puts "Select returns a selection of items that meet a criteria without 
affecting the original array."
puts "An example would be selecting all customers who live in Chicago"
puts
puts "Oh, OK, actually BOTH return a new array."


# 5
puts
puts "---------------------"
puts "Question 5:"
puts "---------------------"
puts "A hash with string keys looks like this: 
my_hash = {'name' => 'Mary', 'fave_color' => 'blue'}"

#6
puts
puts "---------------------"
puts "Question 6:"
puts "---------------------"
puts "This should return NO WAY! because the statement is true, 
which is incidentally the incorrect response."
puts "\n"
x = 1
puts x.odd? ? "NO WAY!" : "yes, sir!"


# 7
puts
puts "---------------------"
puts "Question 7:"
puts "---------------------"
puts "This should return 4"
x = 1
3.times do
x+=1
end
puts x

# 8
puts
puts "---------------------"
puts "Question 8:"
puts "---------------------"
puts "I think this will give an error because it doesn't know
what x is to begin with. I will capture the error with rescue:"
puts 

  begin
    3.times do
      y += 1
    end    
  rescue => e
    puts e.message
  end
puts 
puts
