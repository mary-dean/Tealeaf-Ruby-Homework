# Mary Dean
# 9/7/2014
# Pre-course Homework 9: FINAL EXERCISES
# Tealeaf Academy Programming in Ruby

puts "9/6/2014"
puts "Mary Dean\n\nHomework: FINAL EXERCISES"
def divider
puts "-----------------------------------------------"
end

def line
	puts "\n"
end

# *********************************************
# *********************************************
divider 
puts "Exercise 1: Using EACH"
divider
puts "\nI will generate my array with Array(1..10)"
p num_list = Array(1..10)
puts "\nand print them out\n\n"
num_list.each do |x|
	puts "#{" "*x}#{x}#{" "*x} #{x} #{" "*(x)}#{x}"
end
line
#Ah ha to make padding the trick is to put the string ' ' first and then multiply it.
#If you put the integer first, it says you can't multiply a string.
# *********************************************
# *********************************************
divider 
puts "Exercise 2: Print values > 5"
divider
line
num_list.each do |x|
	padding = 5-x.to_s.length
	puts ("#{' '*padding + x.to_s}"*10) unless(x<6)
	  end
line
puts "All lined up neatly  :-)"
line

# *********************************************
# *********************************************
divider 
puts "Exercise 3: Select method"
divider
line
puts "Here is are the odd numbers, using SELECT"
line
p num_list.select {|x| x.odd?}
line

# *********************************************
# *********************************************
divider 
puts "Exercise 4: Popping and pushing"
divider
line
puts "On your marks, get set, go!"
line
# Here is my num_list with an 11 added
p num_list<<11

num_list.length.times do
	p num_list.unshift(num_list.pop)
end
line
puts "Wow, that was easy and fun"
line

# *********************************************
# *********************************************
divider 
puts "Exercise 5: Get rid of 11, append 3 "
divider
line
puts "I just researched this question so I will try several ways"
line
puts "This is num_list as it currently looks"
p num_list
line
puts "I can reassign the 11th spot with num_list[10] = 3"
num_list[10] = 3
p num_list
line
#reset num_list
#this didn't work as a method
def reset_num_list
	num_list = Array(1..11)
end


puts "I can trim the last item off using num_list[-1]"
num_list[-1] = 3
p num_list
num_list = Array(1..11)
line
puts "I can use the delete_at method to kill the 11"
puts "and replace it with 3"
num_list.delete_at(10)
p num_list<<3
num_list = Array(1..11)
line
puts "I could use MAP to iterate thru and replace the 11's"
p num_list.map {|x| x==11 ? 3 : x}
line
num_list = Array(1..11)
puts "I could use index to locate the 11 and zap it"
puts "It actually looks for value 11 and returns the index...cool"
num_list[num_list.index(11)] = 3
p num_list
num_list = Array(1..11)
line
puts "This version pushes 3 to end IF it successfully deletes 11 first"
p num_list.push 3 if num_list.delete 11
line
puts "Is is possible to delete so easily by value? Without iterating?"
puts "What if there are multiples? I will temporarily add more 11's"
puts "and then zap them using temp_list.delete 11"
line
temp_list = [1,2,11,3,4,5,11,6,7,11,8,9,11]
p temp_list
temp_list.delete 11
p temp_list
line
puts "That is amazing, it worked!"
line

# *********************************************
# *********************************************
divider 
puts "Exercise 6: Get rid of dupes"
divider
line
puts "It is easy to get rid of dupes with uniq"
line
puts "Messy list"
p old_list = [1,2,3,1,2,3,1,2,3,1,2,3,3,2,1]
line 
puts "Clean list"
p old_list.uniq
line 

# *********************************************
# *********************************************
divider 
puts "Exercise 7: Array vs Hash"
divider
line 
puts "An array is an ordered list of items of any kind, in square brackets"
puts "A hash is a sometimes-ordered list of key/values pairs, in curly braces"
line 

# *********************************************
# *********************************************
divider 
puts "Exercise 8: Old Style vs New Style"
divider
line 
puts "Here is an old-style hash:"
old_hash={"fave_color" => "blue", "fave_soup"=>"Clam chowder", "lucky_number"=>7}
p old_hash
line 
puts "And here is new-style hash syntax"
new_hash = {fave_movie: "Tarzan", fave_yogurt_topping:"M&Ms", fave_year: 1972}
puts "{fave_movie: \"Tarzan\", fave_yogurt_topping:\"M\&Ms\", fave_year: 1972}"
#Couldn't find a way to print hash without rocket symbols
line 

# *********************************************
# *********************************************
divider 
puts "Exercise 9: Manipulating Hashes"
divider
line
puts "Suppose you have a hash:"
h = {a:1, b:2, c:3, d:4}
puts h
line 
puts "(1.) What is the value of :b?  It's not h[b:] it's h[:b]"
puts h[:b]
line 
puts "(2.) How do you add to the hash? You say h[:e] = 5"
h[:e]=5
puts h
line 
puts "(3.) Remove items where value < 3.5"
puts "First I will try h.select! {|k, v| v > 3.5} "
puts h.select! {|k,v| v > 3.5}
line 
puts "That worked. But I will also try iterating and deleting"
h = {a:1, b:2, c:3, d:4, e:5}
h.each {|k,v| h.delete(k) unless v >= 3.5}
puts h
puts "That worked too"
line 
# *********************************************
# *********************************************
divider 
puts "Exercise 10: Can hash be array?"
divider
line 
puts "Can hash VALUES be arrays. Of course they can."
puts "We used this example before:"
line 
puts family = {  uncles: ["bob", "joe", "steve"],
            sisters: ["jane", "jill", "beth"],
            brothers: ["frank","rob","david"],
            aunts: ["mary","sally","susan"]
          }
line 
puts "Can you have an array of hashes? Yes, for example:"
line 
my_assets = [{beach_house:"$350,000", english_castle:"$17M", teepee:"$129.99"},
			{honda_civic: "$4,330", harley: "$18,000", rolls_royce: "$75,000"},
			{diamond_tiara: "$2.3M",pearl_earrings:"$250"}]

puts "ASSETS:\n"
puts my_assets
line 

# *********************************************
# *********************************************
divider 
puts "Exercise 11: Ruby API Resources"
divider
line 
puts "I find the most answers to specific questions at Stack Overflow"
line 
puts "But here are other places that look good:"
ruby_resources = ["http://ruby-doc.org/", 
				"https://www.ruby-lang.org/en/",
				"apidock.com/ruby", 
				"http://api.rubyonrails.org/", 
				"http://stackoverflow.com/tags/ruby/info"]
ruby_resources.each {|v| puts "  * #{v}"}
line 
# *********************************************
# *********************************************
divider 
puts "Exercise 12: Grouping information"
divider
line 
puts "  This is similar to the exercise with anagrams."
puts "  I find it difficult to wrap my brain around it."
line
contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
            ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]

contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}

puts "  The first question is how to populate a hash inside a hash"
puts "  After trial and error, this syntax seems to work:"
line 
puts "contacts[\"Joe Smith\"][:eyes] = \"blue\""
line 
puts "  I guess we can assume a one-to-one correspondence"
puts "  that the first array belongs to first contact."
puts "  That makes it easier."
line
puts "  But I still need to convert the array into a hash"
puts "  I think I will make an array of keys, and then combine them"
line 
contact_keys = [:email,:address,:phone]
print "CONTACT_KEYS: "
p contact_keys
line 
puts "  For now I will generate them individually"
puts "  This is a trick I found on apidock.com/ruby/Hash:"
puts "  Hash[*my_array1.zip(my_array2).flatten]"
puts "  lets you combine two arrays into one hash "
joe_data = Hash[*contact_keys.zip(contact_data[0]).flatten]
sally_data = Hash[*contact_keys.zip(contact_data[1]).flatten]
puts "\n  This should be JOE's data:"
puts joe_data
line
puts "\n  This should be SALLY's data:"
puts sally_data
line
puts "  Now I plop them into place"
line 
contacts["Joe Smith"] = joe_data
contacts["Sally Johnson"] = sally_data
p contacts	
line
puts "  Not an elegant solution, but I did it!"
puts "  My biggest problem was not realizing that symbols don't need to be quoted"
line 
puts "  Now I will look at the teacher's answer."
puts "puts contacts[\"Joe Smith\"][:email] = contact_data[0][0]"
puts "\n  Well of course, anyone could do it one by one! :-) "
line 


# *********************************************
# *********************************************
divider 
puts "Exercise 13: Lookup info from hash"
divider
line 
puts "Joe's email is:"
puts contacts.fetch("Joe Smith")[:email]
line 
puts "Sally's phone number is"
puts contacts.fetch("Sally Johnson")[:phone]
line 
puts "Hurray, I used FETCH"
line 
# *********************************************
# *********************************************
divider 
puts "Exercise 14: Group items into hashes with loops"
divider
line 
puts "I need to NOT overthink this"

contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
            ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]

contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}

contact_keys = [:email,:address,:phone]

contacts.each do 
	|k,v|
	counter = 0
	this_persons_info = contact_data[counter]
	v[contact_keys[0]]=this_persons_info[0]
	v[contact_keys[1]]=this_persons_info[1]
	v[contact_keys[2]]=this_persons_info[2]
	counter +=1
end

line 
puts "FINAL RESULT:"
puts contacts
line 
puts " ... I succeeded but it took me an hour."
puts "I wish sublime text matched up your dos with your ends"
line 

# *********************************************
# *********************************************
divider 
puts "Exercise 15: Using Array methods delete_if and start_with? "
divider
line 
puts "Delete all the words that begin with s"
line 
puts "BEFORE:"
p arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']
#woah, I don't even need to use .each!
arr.delete_if {|x| x.downcase.start_with? 's'}
line
puts "AFTER:"
p arr
line 
puts "Now start over and delete the 'w' words too"
line 
puts "BEFORE:"
p arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']
arr.delete_if {|x| x.downcase.start_with? 's', 'w'}
line
puts "AFTER:"
p arr
line 
puts "That was fun! delete_if is very powerful"
puts "You don't even have to iterate, it does it for you"
line 
# *********************************************
# *********************************************
divider 
puts "Exercise 16: map, split, and flatten!"
divider
line 
puts "BEFORE:"
puts a = ['white snow', 'winter wonderland', 'melting ice',
     'slippery sidewalk', 'salted roads', 'white trees']
 line 
 puts "AFTER:"
all_the_words = a.map {|x| x.split(' ')}.flatten
puts all_the_words
line 


# *********************************************
# *********************************************
divider 
puts "Exercise 17: Are these hashes equal?"
divider
line 
puts "Question: are these hashes the same?"
line 
puts hash1 = {shoes: "nike", "hat" => "adidas", :hoodie => true}
puts hash2 = {"hat" => "adidas", :shoes => "nike", hoodie: true}
line 
puts "I am going to guess NO because I heard that hashes"
puts "now have an order..."
line 
puts "The answer is:"
puts hash1 == hash2
line 
puts "So I was wrong. That's interesting. So order doesn't matter at all..."
line
puts "Hey, I'm all done!"

a = [1,2,3,4,5]
b = ["a","b","c","d","e"]
c = Hash[*a.zip(b).flatten] 
puts c
