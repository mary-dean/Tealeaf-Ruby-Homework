Hello, World. 

My name is Mary and I am taking a class in Ruby programming. This is where I will keep my homework assignments for the TeaLeaf Academy.


## 1. THE BASICS ##
Date completed: **9/1/20014**
My work file: **homework01_basics.rb**

Things I learned during these exercises:

* It's easy to generate random numbers: `rand(1000..9999)` gives you random numbers between 1000 and 9999. `rand` by itself generates a long decimal like this: .425792345910.  In the exercise with the floats I shortened it like this: `x = (rand * 100).round(2)` which gives you numbers like 42.57  I am not sure if "round" is just for show or if it actually shortens the number.
* You can parse digits by dividing and modding in chunks of 1000, 100, 10, etc. I don't know if I will ever use that for anything. If I really needed to do that I would convert it to a string and parse it by character. 
* String interpolation seems to be more forgiving than the .to_s method. I don't understand why this gave me errors: `puts "The thousands number is: "  + (n/1000).to_s` because it worked in irb. When you "interpolate" the same thing, it works fine: `puts "The thousands number is: #{n/1000}"`
* To see what "type" of data something is, use my_object.class. `1234.class => Fixnum`
* When your hash key has no spaces, it doesn't matter if you refer to it with quotes or without.
`:Tarzan => 1918` can be referenced with 
`movies[:"Tarzan"]`
* I need to remember .each doesn't require a "for." You don't say `for movies.each do`, you just say `movies.each do`. 
* The new way to make hashes is like this, much more elegant:

```ruby
	movies = { jaws: 1975,
		anchorman: 2004,
		man_of_steel: 2013,
		a_beautiful_mind: 2001,
		the_evil_dead: 1981 }
```
* I discovered two cool methods: `.keys` and `.values`. To return an array of all the keys or values in a hash, you just say: `movie_list.keys` or `movie_list.values`
* On the last exercise I wanted to learn how to "quote" the entire message without breaking it up into puts statements, which led me to **Heredocs**. You can put a lot of text after **<<** just by telling it what you will use to signal the end of the text. Most people seem to use <<EOS or <<EOT. The important thing to know is that (it seems) you have to put BOTH the start AND the "end of text" signals on lines by themselves and the "end" marker has to be to the very left of the screen. Like this:
```ruby
error_msg = <<END_MARKER 
SyntaxError: (irb):2: syntax error, unexpected ')', expecting '}'
from /usr/local/rvm/rubies/ruby-2.0.0-rc2/bin/irb:16:in `<main>'
END_MARKER
```
* The last thing I learned was how to use "markdown." I was annoyed by how my readme file lost all its formatting when I pushed it up to github. So I found a nice shareware editor called "MarkdownPad 2," which is what I am writing this in. It lets you highlight code and link directly to github. Here is a good reference for github's markdown special features: https://help.github.com/articles/github-flavored-markdown


## 2. VARIABLES ##
Date completed: **9/3/20014**
My work file: **homework02_variables.rb**

What I learned, and things to to remember:

* I usually trip myself by adding things that aren't needed. I always want to say `IF...THEN`, or `IF...DO`, or `IF {  }` and you don't need any of those things. Likewise, sometimes I want to use `do` AND a curly bracket. But I'm learning.
* I had fun trying to draw with ascii characters when I was repeating the person's name. You can create varying lines of spaces by multiplying a number times a single space:
```ruby
	    while spaces < 10
	    puts "#{name}#{' '*spaces}#{name}"
	    spaces = spaces +1
	    end
```
```
Mary Dean          Mary Dean
Mary Dean         Mary Dean
Mary Dean        Mary Dean
Mary Dean       Mary Dean
Mary Dean      Mary Dean
Mary Dean     Mary Dean
Mary Dean    Mary Dean
Mary Dean   Mary Dean
Mary Dean  Mary Dean
Mary Dean Mary Dean
Mary DeanMary Dean
Mary Dean Mary Dean
Mary Dean  Mary Dean
Mary Dean   Mary Dean
Mary Dean    Mary Dean
Mary Dean     Mary Dean
Mary Dean      Mary Dean
Mary Dean       Mary Dean
Mary Dean        Mary Dean
Mary Dean         Mary Dean
```

* I learned to use the .split method. To get the person's first and last name out of a string: 
```ruby
fname = name.split.first
lname = name.split.last
```
* I wanted to give the person the chance to correct their name. So I wanted to reassign fname or lname ONLY IF they changed it. I tried using unless with nil: `fname = x unless x.nil?` but this didn't work. But the .empty? method worked:
```ruby
fname = name.split.first
puts "\n\nPlease confirm that your first name is '#{fname}' by pressing Enter.
If not, please correct it here:" 
x = gets.chomp
if !x.empty? 
  fname = x
end
```

## 3. METHODS ##
Date completed: **9/4/2014**
My work file: **homework03_methods.rb**

Things I learned or want to remember:

* I wanted to make my program pause in the same way that a DOS batch file does, with "pause." I could only find timers, so I made my own little pause method:
```ruby
def pause_for_applause
	puts "... Press Enter to continue..."
	gets
end
```
* I kept trying to get newlines in my output and kept forgetting that \n by itself needs to be in quotes: puts "\n"
* I played around with the order of execution by embedding one method (get_name) inside another (greeting). 
```ruby
def get_name
	puts "Tell us your name\n"
	gets.chomp	
end

def greeting
  puts "\nHey, Everyone! I want you to meet my 
	friend #{get_name}!\n\n"
end
```
When I ran `greeting`, I got:

		Tell us your name
		Mary		
		Hey, Everyone! I want you to meet my friend Mary!
Which is what I wanted. The take-away is that when you use string interpolation, Ruby does the computations first (getting the name) and then patches together the string.
* For fun, I made a little method called `greet_back` which chose random greetings from an array ["Hello", "Howdy", "Nice to meet you", etc.] and randomly matched them with an array of names ["Susie", "Jack", "Snoopy", etc.] So each time you run the program, it prints different greetings. I added random spacing to make it seem like a room with voices coming from different directions: 
	
	
	Hey, Everyone! I want you to meet my friend Paula!
                       Hello, I'm Susie!
	       Ralph here!
	              You can call me Snoopy!
	       Howdy, I'm Peg!
* Since I was able to stick a method right inside of an interpolated string, I was curious to find what would happen if I had a method and a variable with the same name. Which would "win"?  I made a method called say_hello which said "Hola", and a variable with the same name that said "Bon Jour." What I learned was that the VARIABLE name has precedence over a method with the same name. I assumed it would be the opposite, that methods would be "dominant" so to speak. But since you can call a method explicitly with say_hello() it makes sense that the variable name would be Ruby's first assumption.
* I am curious about structures like this:
```ruby
puts name = "Joe"
Joe
puts "Hello, #{name}"
Hello, Joe
```
Does that mean we can assign variables in the middle of our code anywhere? Could I assign a value to a variable right inside the block of code inside a string interpolation, for example? Like `"Hello, #{name=get_name}"`? Need to go back and try this.

## 4. FLOW CONTROL ##
Date completed: **9/4/2014**
My work file: **homework04_flow_control.rb**

What I learned:

* My big achievement was to start using the TERNARY operator. It's really handy, once you get used to it codiness. I will try to use it as often as possible. Here is my method that capitalizes strings over 10 characters long:
```ruby
def cappy(s)
	s.length > 10 ? s.upcase! : s
end
```
Isn't that succinct?  It seems that a ternary operator can function as an entire if/then statement:
```ruby
'4' == 4 ? puts("TRUE") : puts("FALSE")
```
* I also learned to use RANGES. Just to practice, I used four different techniques to test if a number was inside of a range: 
```ruby
when n.between?(1,25) then "Your number is between 1 and 25"
when (26..50).include?(n) then "Your number is between 26 and 50"
when (51..75)===n then "Your number is between 51 and 75"
when n >= 76 && n<=100 then "Your number is between 76 and 100" 
```
Then I re-wrote it using this more compact style:
```ruby
case n
	when 1..25 then "Your number is between 1 and 25"
	when 26..50 then "Your number is between 26 and 50"
	when 51..75 then "Your number is between 51 and 75"
	when 76..100 then "Your number is between 76 and
```


## 5. LOOPS and ITERATORS ##
Date completed: **9/4/2014**
My work file: **homework05_loops.rb**

What I learned, and things to remember:
*The return value of .each is the ORIGINAL collection, not the altered collection.
* I still don't quite get scope. I thought they said that methods could use variables that were defined outside of the method, but not vice versa. So why can't I do this:
```ruby
names = ["Joe", "Frank", "Pat"]
def greet_people
  puts "Hello, #{names[0]}!"
end
greet_people
```
It says "undefined local variable". So obviously I CAN'T access variables from outside my methods? But what if I want to re-use my array elsewhere, in another method? I have a feeling instance variables will come into play here.
* I wanted to try using a DO WHILE loop since they are strange to me. They don't use the word DO for one thing. Instead, they have a begin/end structure. So I made a cute method that hurls insults at you until you tell it to stop. I wanted the do-while loop because that way the user is guaranteed to be insulted at least once. 
* I am also really liking the ease of use of Ruby's rand() function. I use it all the time to choose random items out of an array. Here is my insult_me method, which I am very proud of. The key is this line: `puts "You are #{insults[rand(0..insults.length-1)]}!"`
```ruby
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

```
* Regarding recursion, it comes dangerously close to what Excel would call a "circular reference". I see why they put it in the chapter on loops, because it's really important that the recursion be forced to STOP at some point. 

## 6. ARRAYS ##
Date completed: **9/4/2014**
My work file: **homework06_arrays.rb**

What I learned:
* You can create an Array on the fly with Array(1..3). It works with letters, too: Array("a".."z")
* I learned a lot of cool array methods, like array.index, array.sort, array.map, etc. I found they were harder to put into practice than you might think. During the anagram exercise they came up with:
```ruby 
    sorted_words = words.map {|w| w.split("").sort.join}
```
I'm starting to feel more comfortable with stringing methods together like that.
*I learned that strings function like an array of characters in that you can say string[6] to get the 6th character (ok, 7th). 
* I ran into trouble trying to use include? or has_value? when you are dealing with multidimensional arrays or nested hashes. Since 'jane' was a member of 'sisters' for example, include did not find her. You have to flatten it first
* I learned a really cool trick, which is that you can look up all the values at several indices at once. Like this: 
```ruby
> indexes = [1,4]
===> [1, 4]
> myarray = [1,2,3,4,5,6]
===> [1, 2, 3, 4, 5, 6]
> myarray.values_at(*indexes)	
===> [2, 5]
```
The trick is that the * symbol extracts the array into arguments that get passed to the method. I was going to use this to pull out the anagrams during the anagram exercise but I never succeeded in generating the list of indices in the first place. 


## 7. HASHES ##
Date completed: **9/6/2014**
My work file: **homework07_hashes.rb**

What I learned:

* I became more comfortable with symbols. I used to find it confusing where the colon went, but it seems it doesn't matter. I also had big trouble because I kept putting quotation marks around my hashes but you DON'T use them. 
* I created a Frankenstein by merging two arrays of corpse attributes :)  I learned that if you have an intersection of keys when merging, the merge will take the value of the second array that was merged, which makes sense. 
* I am starting to understand the concept of hashes as optional parameters. It is cool that you don't have to decide up front how many arguments you will have. 
* I tried to make a nice neat table in the exercise about family members. It looks like this:
```ruby
                 MY FAMILY
  ------------------------------------------
  uncles     sisters     brothers     aunts
  ------------------------------------------
  bob        jane        frank        mary
  joe        jill        rob          sally
  steve      beth        david        susan
```
I like things to look nice.
* I really tried to do the anagram exercise without peeking at the answer because I did every other exercise in the book by myself, but I got stuck. My approach was to sort the words and then generate a list of keys by using array.uniq!.  Then I was going to compare each item on the unique list to the list sorted words and come up with a list of indices showing the location of each word. Then I would apply those indices to the original word list. I got lost at the point of trying to add the indices to a nested hash. I would like to review the solution when I am more awake because it is very elegant.  
*Grrr, I though Hashes would be the last of the precourse topics, but now I see there are many more. Onward!

## 8. MISC TOPICS ##
Date completed: **9/6/2014**
My work file: **homework08_misc.rb**

What I learned:

* I was familiar with regex and don't plan to get deeply into it, but I found it helpful to google around and collect regex's that people have already made to validate email addresses, hex codes, IP addresses, and so forth. 
* I am starting to see that the APIs are very readable and very useful for finding handy functions that do just about everything.
* The first time I read about blocks and proc was in *The Well Grounded Rubyist* by David A. Black. Check out this horrible sentence (in an otherwise readable  book):

> Understanding Proc objects thoroughly means being familiar with several things: the basics of creating and using procs; the way procs handle arguments and variable bindings; the role of procs and *closures*; the relationship between procs and and code blocks; and the difference between creating procs with Proc.new, the proc method, the lambda method, and the literal lambda constructor ->.

I wrote "WTF?" next to it, and assumed it was all beyond my level of understanding. However, now I am getting it. I'm not sure how procs apply in real life, how they differ from methods, but at least I am not in the dark. 
* I wanted to print a long error message to the screen and I discovered this handy regex that breaks a long message into lengths of your choosing:

```ruby
long_string = "Exception handling is a structure used to handle the possibility of an error occurring in a program. It is a way of handling the error by changing the flow of control without exiting the program entirely."
formatted = long_string.scan(/\S.{0,#{width-2}}\S(?=\s|$)|\S+/)
puts formatted

=>
    Exception handling is a structure used
    to handle the possibility of an error
    occurring in a program. It is a way of
    handling the error by changing the flow
    of control without exiting the program
    entirely.
```

## 9. FINAL EXERCISES ##
Date completed: **9/7/2014**
My work file: **homework09_FINAL_EXERCISES.rb**

What I learned:

* These exercises were fun and I felt fairly competent after having completed all the chapters in the book. I tried to push myself to go beyond just answering the question and do fancy things like this:
```
Exercise 1: Use EACH to print each element of an array

 1  1  1
  2   2   2
   3    3    3
    4     4     4
     5      5      5
      6       6       6
       7        7        7
        8         8         8
         9          9          9
          10           10           10

Exercise 4: Popping and pushing

		[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
		[11, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
		[10, 11, 1, 2, 3, 4, 5, 6, 7, 8, 9]
		[9, 10, 11, 1, 2, 3, 4, 5, 6, 7, 8]
		[8, 9, 10, 11, 1, 2, 3, 4, 5, 6, 7]
		[7, 8, 9, 10, 11, 1, 2, 3, 4, 5, 6]
		[6, 7, 8, 9, 10, 11, 1, 2, 3, 4, 5]
		[5, 6, 7, 8, 9, 10, 11, 1, 2, 3, 4]
		[4, 5, 6, 7, 8, 9, 10, 11, 1, 2, 3]
		[3, 4, 5, 6, 7, 8, 9, 10, 11, 1, 2]
		[2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 1]
		[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
```
 
* I am trying to develop the "now" habit, which means every time I have a question, I google it and track down the answer right then, and jot it down in my notes. Today, for example, I wanted a quick way to generate a hash out of two arrays, and I found this incredibly helpful tidbit: 
```ruby
A trick I found on apidock.com/ruby/Hash

keys = [:a, :b]
values = [1,2]
h = Hash[*keys.zip(values).flatten] 

My example:
a = [1,2,3,4,5]
b = ["a","b","c","d","e"]
c = Hash[*a.zip(b).flatten] 

Result: 
{1=>"a", 2=>"b", 3=>"c", 4=>"d", 5=>"e"}
```
Isn't that amazing? 
* Another example is yesterday I was researching how to replace specific items in arrays. So when the question came up today:
```
Exercise 5: Get rid of 11, append 3
This is num_list as it currently looks
[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
```
I was able to do it in 7 different ways:

```ruby

puts "I can reassign the 11th spot with num_list[10] = 3"
num_list[10] = 3

puts "I can trim the last item off using num_list[-1]"
num_list[-1] = 3

puts "I can use the delete_at method to kill the 11"
puts "and replace it with 3"
num_list.delete_at(10)
p num_list<<3

puts "I could use MAP to iterate thru and replace the 11's"
p num_list.map {|x| x==11 ? 3 : x}

puts "I could use index to locate the 11 and zap it"
puts "It actually looks for value 11 and returns the index...cool"
num_list[num_list.index(11)] = 3

puts "This version pushes 3 to end IF it successfully deletes 11 first"
p num_list.push 3 if num_list.delete 11

puts "What if there are multiples? I will temporarily"
puts "add more 11s and then zap them using temp_list.delete 11"
temp_list = [1,2,11,3,4,5,11,6,7,11,8,9,11]
p temp_list
temp_list.delete 11
=>[1, 2, 3, 4, 5, 6, 7, 8, 9]
puts "It worked!"
```
All in all I think this last week was time well spent. I am definitely developing "muscle memory," as they said we would. On the other hand, I despair about how much time it took to complete these exercises. Every session stretched into the wee hours of the night. I think the most important thing is to have well organized notes, so that time is never wasted, and you can always retrieve what you have learned. Onward to blackjack!