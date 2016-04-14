# Tealeaf Course 1, Lesson 2: Object-oriented programming #

Mary Dean
9/20/2104

## Rock Paper Scissors OOP Style?
tealeaf-lesson2/rock_paper_scissors.oo.rb

**What I learned**

I learned that there is a BIG difference between understanding instance variables and 'self' when you are doing exercises vs. trying to make a working game. I went through a big learning curve on this project. The end result is not 'object oriented' in the least. I don't yet get the basic concept of making classes inside a game which is also a class. I will try to tackle that on the next project. Right now I am just trying to wean myself away from the 'procedural' techniques we learned before, i.e. passing variables back and forth.

My first attempt at game play looked like this:
```ruby
weapons = choose_weapons(player1, player2, weapon_choices)
winner = determine_winner(player1, player1_weapon, player2, player2_weapon)
announce_winner(winner)...
```

Only gradually did it sink in that, with the happy discovery of instance variables, I no longer needed to pass arguments from place to place. In the end, my entire 'run' routine looked like this:
```ruby
 def run
    get_player_names
    continue = true
    while continue
      choose_weapons
      announce_weapons
      determine_winner
      announce_winner
      increment_score
      announce_score
      continue = keep_playing?
    end #end of while loop
  end #end of run
```
I know that's a lot of subroutines for a tiny game, but I wanted to follow the teacher's advice about having methods do only one thing, and separating methods that do things from methods that show things. 

The first big hurdle was figuring out how to 'run' a game in the first place. Only when I tested another student's blackjack game and saw this at the bottom:
```ruby
Game.new.run
```
did I understand that you DON'T, apparently, have to create a game object like this:
```ruby
new_game = RockPaperScissors.new(player1, player2)
```

The second hurdle was that I had set up the game so you started by passing the player's names to the Class. But how do you GET the player's names, then? I was doing it outside the class, and then launching the game, but I knew that couldn't be right. Then I tried adding the `get.chomp` code right into the initialize method, which actually worked fine, but didn't seem kosher. I kept thinking I needed a way to call a method (get_player_names) out of the game class itself before I created a new game object. Obviously, I wasn't thinking very clearly because the next day it was obvious that I didn't NEED to have my player names beforehand, duh!

Another conceptual issue I need to understand is how to break out of a while loop when you are no longer using procedural programming and its multiple nested loops. For example, when you get this choice:
```ruby
Please choose (R)ock, (P)aper, or (S)cissors
```
What if you chose 'z'?  I wanted to make it so you lost your turn and the other player got a free point, and then you were asked if you wanted to continue. That's easy to do in a nested while loop, but when you are inside a helper method, neither 'break' nor 'next' will get you out of the main while loop. 
```ruby
   while continue
      choose_weapons	#Player makes bad choice
      announce_weapons
      determine_winner
      announce_winner
      increment_score	#...so I want to leap here
      announce_score
      continue = keep_playing?
    end 
```
In other words, I wish there was a method called 'continue_at_step_#5'.

Once cute thing I did was make a method called 'adjective' so the computer could make his language more colorful. 

```ruby
def adjective
    arr = ["horrid", "dangerous", "monstrous", "wicked", "frightening", "vicious", "terrible",
            "fearful", "deadly" , "dreaded", "treacherous", "evil", "villainous", "nefarious",
            "nasty", "brutal", "disgusting", "vile", "foul", "nasty", "barbarous", "malevolent"]
    arr.sample 
  end
```
That way each round is filled with exciting and new verbiage:
```ruby
Please choose your implement of destruction:
  (R)ock, (P)aper, or (S)cissors... then press Enter

Mary is wielding the vile SCISSORS.
While Rasputin counter-attacks with the deadly ROCK
. . . 
Mary is wielding the frightening PAPER.
While Rasputin counter-attacks with the foul SCISSORS
```
Well, beyond that, it was mostly a matter of paring things down. I realized that I didn't need ANY attr_accessor variables because I wasn't interacting with anything outside of the game. Then I realized I didn't need to pass ANY arguments like `player1_weapon` because they were already accessible to the method by virtue of being instance variables. When you make these kinds of realizations, it's like the clouds parting and rays of sunshine peeking through. 

Like I said, I didn't do any actual object oriented programming here. I don't understand how I would create a Class called 'Player' when I'm already inside a Class called RockPaperScissors but I am guessing that classes can be nested? Perhaps I will peek at the solution now.

----------
After watching the solution video I don't feel bad about not making my RPS very 'oopy' because the teacher had a lot of problems deciding if Player or Hand or PlayerHand should be the object, and it got messy. However, I picked up some really cool tips:

COMPARABLE is something I had heard of before and couldn't remember how it worked. I knew it had something to do with the rocket operator <=> but I forgot about including the Class Comparable and about redefining the MEANING of the rocket. That is very useful in a game like Rock Paper Scissors. 

Also, I see now that I was hung up on the idea of squeezing my game entirely inside a single Class, which totally isn't necessary. A single .rb FILE can contain a number of classes, like Player and Weapon, which are parallel to, NOT nested, inside the Game class where all the action happens. 

I also want to remember his method of making a simple loop that forces a person to choose from the choices you are giving him:

```ruby
begin
  puts "Pick one: (p, r, s):"
  self.choice = gets.chomp.downcase
end until CHOICES.keys.include?(player_choice)
```
That last line is the key. It's NOT saying 'end until', which is how it reads and is confusing. It's saying 'do what's between the begin and end markers UNTIL such and such.  

Another thing I need to become accustomed to is how you can just snatch methods from other classes by chaining them together:
```ruby
computer.hand.display_winning_message
``` 
It is so cool how easy that is.

Every time I write one of these readme.md files, I think: I will just jot down a few bullet points of the things I learned and the things I want to remember from this exercise. But it always turns into quite an essay. That's good, though, because I think reading through these in the future will refresh my brain, especially if I go a long time without doing this stuff.

## Tic Tac Toe - OOP Style
### Eureka!
I finally had my eureka moment with object-oriented programming.

There I was, at 2 in the morning, trying to make an object-oriented tic-tac-toe game. I had a Game object, a Special Effects module, and a Game engine. It was still mostly procedural. So I decided to push myself, to extract the Player out of the game and try to make him or her a separate object.

A player can be a human or a computer. I wanted one Player class that could handle both. So I added an instance variable called @type. Each player would also have a @name and a @token.

Then, to make passing this Player information around easier, I created a sexy `to_s` method that would organize the needed information into an array. So when you ask to to see player 1 or player 2 you will get this: 
```ruby
puts p1
=> ["human", "Myrtle McGoo", "%"]
puts p2
=> ["computer", "Chris Cross", "@"]
```

Back in my Game class, I created a method to introduce the players. I would call it like this:
```ruby
game.introduce_players(p1, p2)
```
And it would say something like this:
```
Nice to meet you, Myrtle McGoo!
You will be playing against Chris Cross
```
So I wrote:
```ruby
puts "Nice to meet you, #{p1[1]}"
puts "You will be playing against #{p2[1]}"
```
...because the player's name is always going to be the 2nd item in the array, thus index spot [1]. 

Easy. Yet, no matter how I tried, I couldn't get it to work. It kept saying `Invalid method []`. Maybe my array was being interpreted as a single string? Perhaps I needed to `.split` it... Or maybe I needed to `.join` it? Or maybe I needed to `.split` AND `.join` it? 

Nothing worked. What the hell? Why on earth was extracting the nth element out of a simple array giving me this much trouble? It was now 4 AM and I was up writing a freaking TIC TAC TOE game, and THIS is what got me stuck? To fathom WHAT the computer might be thinking I wrote:
```ruby
puts p1.class
=> Player
```
Well, yes, I knew that. And I definitely knew that the Player class returns an array, or at least a string that looks like an array, because I wrote it myself! ...clunk.
```ruby
puts p1.include?("human")
=>undefined method `include?' for [human, Myrtle McGoo, %]
```
It looked like an array yet it didn't quack like an array. Why did no Array method work on it?

...And why did `[human, Myrtle McGoo, %]` have no quotation marks? 

...clunkity clunk

...Why does it think it's not an array? 

...ding! dong!

...Wait a minute...

...It's NOT an array!

...It LOOKS like any array because I TOLD it to present itself that way. But it's really a Tic-Tac-Toe Player! I don't NEED to pass information around via arrays any more. A living, breathing, Tic-Tac-Toe Player that I created out of nothing! 

```ruby
puts "Hello, #{p1.name}, my name is #{p2.name}. My game token 
is a #{p2.token} and I am a #{p2.type}. What are you? Oh, really?
You're a #{p1.type}? I love your #{p1.token}, where did you get it?
Unfortunately we #{p2.type}s are limited to the characters on the
keyboard. Join me for a game?"
```
So, that was my Eureka moment. Even though I could have told you that an object is passed by reference, I didn't really get it until now. When you pass a variable that refers to an object, you get the whole kit and kaboodle.  Anything the object can do, you can do. Even if you didn't ask for the Player's name, or token, or type, you will still receive it. I get it!

### Adding a coin toss

It's not fair to always let the human go first, so I added a coin toss.
```
Nice to meet you, Barney Bulger. Your token will be X
You will be playing against... SQUIRREL!
Squirrel will be using this token: ¥. Let's see who goes first.

         ..-"""""-..
       .'    ___    '.
      /    ."\  `\    \
     ;    /, (    |    ;
    ;    /_   '._ /     ;
    |     |-  '._`)     |
    ;     '-;-'  \      ;
     ; """" /    \\    ;
      \    '.__..-'   /
       '._ 2 0 1 4 _.'
          ""-----""

Please choose (h)eads or (t)ails
```
This caused more trouble than I anticipated. I had to add the concept of "first player" and "second player" which no longer corresponds to "player 1" and "player 2". I considered making "firstness" or "secondness" a property of the Player, but that doesn't make sense because choosing who goes first should be part of the gameplay. 

Unbelievably, the biggest problem ended up being determining who is the second player. I could say: 
```
second_player = first_player.type == "human" ? p2 : p1
```

but that means I assume that p1 is always going to be type human and p2 will always be the computer. (See "Goofs and Gotchas" below for why this simple issue turned into a time-consuming problem.)

I also had to change the `game.take_turn` method to deal with both kinds of player. A human is asked for his response, and the computer chooses at random. The good thing about this arrangement is that you could potentially add different types of players, and this would be the only method that would need to be extended. 

Finally, now that turns can be taken either way -- player 1 then player 2, or player 2 then player 1 -- it also changes the dynamics of the user interface. I was clearing the screen after each round, but now it should be after the second player, whoever that might be.  I did NOT fix this problem with the result that sometimes the screen is cleared too quickly. I am tried to manage my time better because all of these games have taken me waaaay too long, so I will leave some items as bugs. 

```
           |       |
           |   ¥   |
           |       |
    +-+-+-+ +-+-+-+ +-+-+-+
           |       |
           |   X   |
           |       |
    +-+-+-+ +-+-+-+ +-+-+-+
           |       |
        X  |   ¥   |   ¥
           |       |
Squirrel has chosen space 2. . .
Choose an available square, Myrtle McGoo
```
### Clearing the screen -- issue with operating system

The user interface is much improved by having the board stay in one place instead of scrolling down the console. As with many things in Ruby, doing this was easier than expected. You just say:
```
system 'cls'
```
or on a Mac you say:
```
system 'clear'
```
Which obviously leads to the question, how do I know which one to use? There are, apparently some Ruby constants you can use:
```
puts RUBY_PLATFORM  #i386-mingw32
puts ENV['OS']    #Windows_NT
```
But rather than get bogged down in that, I just added both commands in a row, and it seems to work OK -- in Windows, at least.

### Goofs and Gotchas
As a beginner, I feel like my study time is a never-ending series of goofs and gotchas. I can't tell you how many times I have lived this scenario:
```
"I'm making some big changes here. I think I better save this
under a different file name. That way I can come back to it if 
I break it."

     (File > Save > MyFileV2.rb)

"There, I feel so much better. Now let's make these changes..."

     (Do a bunch of work.)

"Damn, it's not working."

     (Take it apart, try it a different way.)

"Damn, it's still not working!"

     (Throw out everything, despair, try again.)

"Why the heck isn't this working?"

    "Ohhhh! Noooo! I'm still running the old file name!"
```
That's what happened when I was performing the simple task of determining who would be the second player. Then, when I finally realized my mistake, I ran into this gotcha: 

```
"I've done my coin toss, and I know who first_player is. Now I need 
to know who second_player is. That should be easy. I will just delete 
the first player out of the array, which will leave the other player."

second_player = [p1, p2].delete(first_player)
```
After much troubleshooting, I realized that first_player and second_player were coming up as the same object. Why? Because it turns out that `[array].delete(value)` does NOT return the array minus the deleted value. It returns the value you deleted! More precisely:

> delete() will return the deleted value, not the modified array with the value removed. 

So I was setting first_player and second_player to be the same object. That seems un-intuitive to me. But the really frustrating thing is that the easiest solution:
```
second_player = [p1, p2] - [first_player]
```
was the FIRST thing that occurred to me and the first thing I tried, but since I had goofed and forgot to changed the file name, I never knew that it had been the right solution all along. 

### Modules and module_function

This project really helped to clarify what a module is and isn't.  Because of it's name, I had the idea that a module was a toolbox that you could put your utility methods in, and call them when needed. So I decided to pull all of my special effects -- things unrelated to the game and just for fun, like banners...

```
      +-+-+-+-+-+ +-+-+-+-+  
      |L|E|T|'|S| |P|L|A|Y|  
      +-+-+-+-+-+-+-+-+-+-+-+
      |T|I|C| |T|A|C| |T|O|E|
      +-+-+-+ +-+-+-+ +-+-+-+
```
...into a SpecialEffects module. I had this idea that I could say:
```
SpecialEffects.show_intro_banner
```

But no, it doesn't work that way.  The proper way to use a module is to use `include`, or `extend`.  But that's exactly what I *didn't* want to do because lets say you had a thousand ascii graphics. You wouldn't want to paste in the whole lot of them just so you could show your "Let's Play Tic Tac Toe!" banner.

Even worse, I had to include the SpecialEffects module in several objects, which is even messier.

Research has pointed me in two directions:

1. There is something called module_function which is incredibly useful. It does exactly what I wanted... lets you call individual functions out of the module *without* including it in your Class! That's cool, but I'm not clear on how that would work if the module was in a separate file. 
2. Meanwhile, I watched the TeaLeaf video about Class methods. These methods work even if you haven't instantiated any objects! And they work exactly like I had hoped my SpecialEffects would work. You can say: `SpecialEffects.clear_screen` and it works! 

Learning, learning, learning.

### Bug list
As I mentioned, I am having serious problems with time management. I am still only on Lesson 2 and I have been working on this course for a month. Therefore I am going to start accepting "well enough" and moving on. Instead of reworking and reworking my code, I will just keep track of bugs. So the bugs in my tic tac toe game are:

1. It doesn't handle a tie
2. It clears the screen too quickly if the computer wins the coin toss
3. It doesn't ask if you want to play again
4. It doesn't keep score

## Object-Oriented BlackJack ##

I decided to start out with the goal of having multiple players, multiple decks, and betting. It's a good thing I did because it would be have difficult to implement these later, especially the multiple players. It took me some time to figure out how to assign variables to identify new players when I didn't know how many there might be. I started down a few treacherous paths until I realized it was a simple array. Dealer would be player[0] and the person interacting with the game would be player[1], and then everyone else just gets appended from there. 

I discovered that objects have a tendency to grow out of control. Case in point: my deck object gradually evolved into what should have been my blackjack game object. It just seems most logical to put card-related methods where the cards were. In a future version, I will slim down my deck. Likewise, I know that Hand should be separated from Player. After all, one player could have multiple hands. But in dealing with multiple players I found it easiest to store each player's current hand in an instance variable. 

I found this project alternately exhilarating and frustrating. I was happy to find how quickly I could put the basics together. The idea of muscle memory really is true. I don't have to consult my notes as often, and I often write a whole page worth of code before testing it out, instead of eeking it out line by line. That said, I still ended up spending HOURS tracking down the dumbest bugs. For example, no matter what I did, I couldn't get blackjacks to be properly acknowledged, and since blackjacks rarely happen, I had to play the game dozens of times to get one to appear, just to see that it still wasn't working. It turned out to be the silliest thing. My flag to signal a blackjack was "BLACKJACK!" but I had been testing for "BLACKJACK" without the exclamation point. The scary thing is that you often destroy a perfectly good method or object because you think it isn't working, when all along it was working just fine.

Counting cards and betting was easy and fun. I like displaying the current card count which gives you an idea of what your chances are of getting a particular card. 
```
    Dealer now has [3 of Diamonds, 10 of Diamonds]
    Mary now has [6 of Diamonds, 7 of Hearts]

The deck has 48 cards left. Here is the current card count:
======+++++===============================================================
RANK: |  A  |  2  |  3  |  4  |  5  |  6  |  7  |  8  |  9  |  10 | Face
--------------------------------------------------------------------------
QTY:  |  4  |  4  |  3  |  4  |  4  |  3  |  3  |  4  |  4  |   3 |  12
======+++++===============================================================
```
Of course my ascii table gets misaligned if you use more than 2 decks, but when I implement this on my web version I assume that won't be a problem.

I have no idea how betting occurs in real blackjack, but in my version, everyone gets 1 card, and then they bet, and then they receive a second card. I keep track of each player's money pile as it grows or dwindles. In a future version I will keep track of your initial money pile AND its final value to see if you walk away a winner or a loser. But what's the most interesting is to track how much the house wins or loses. It would be fun to run an automated test playing hundreds of rounds to see if it's true that the house always comes out ahead.

Which brings me to my final point... TESTING. Honestly, I thought I was going to be one of those who fell into the anti-testing camp. I don't know much about it, but I know there is currently a rebellion going on in the Rails community against the over-emphasis on testing, and test driven development. I don't know enough to have an opinion, but this project made me realize how valuable it would be to have a script that ran my blackjack game a hundred times. Since I had multiple players and multiple decks, and each player had a pot of money and a bet, it took me several minutes to run my program through each micro-iteration. It got very frustrating, especially when you are trying to test rare events, like blackjacks. So now I will definitely be much more open to the concept of building in a testing mechanism. 

Well, off you go, little blackjack game. I am moving on to lesson 3 :-)

### Post mortem 

Well, that was no fun!  When people tried my blackjack game on their Macs, my nice little 'hand' arrays looked like this:
```
Frank, you have [#<Card:0x007ff273172bf0 @rank="Ace", @suit="Hearts",
 @face_up=true>, #<Card:0x007ff273172588 @rank="Jack", @suit="Clubs", 
@face_up=true>]. 
```
They looked like this in Windows:
```
Frank, you have [Ace of Hearts, Jack of Clubs].
```
It wasn't hard to fix this problem. As a quick fix I just went in and did the conversion to a string outside of the string interpolation:
```
string_hand = player.hand.join(", ")
puts "#{player.name}, your cards are #{string_hand}"
```
but it made me realize that I really need to learn to use a Mac, since everyone in the Ruby community seems to favor them, not to mention everyone in my family. So I spent the better part of the day setting up a Mac Mini with an old monitor, installing Ruby, and learning my way around a very different operating system. As expected, I hated it, because I couldn't figure out how to do the simplest things, like find a plain text editor, or copy something from a network drive. But once I installed Sublime Text, it was smoother sailing. I am glad I did this because now I can test everything on both machines. 

### Answers to Quiz questions for lesson 2

**(1.) What is...**

@a = 2 -- an instance variable being set to value of 2

user=User.new  -- how you would instantiate a new object in user class. [He calls it a NEW INSTANCE OBJECT]

user.name -- a call to the getter method called name [BY THE user OBJECT]

user.name='Joe' -- a call to the setter method name=


**(2.) How does a class mixin a module?**

Using the keyword include. Interestingly the module name is NOT in quotes. E.g.: `include swimmable` even though you DO use quotes when you say something like `require 'pry'`

**(3.) Difference between Instance and Class variables:**

Instance variables maintain the state of the individual objects that were created by the class. They look like this `@instance_variable`

Class variables maintain information about the class overall, such as how many objects have been instantiated from it. They look like this: `@@total_cars`

[HE SAYS CLASS VARIABLES ARE SHARED AMONG THE CLASS AND ALL IT'S DESCENDANTS. OH, SO THAT MEANS ALL THE OBJECTS THAT WERE CREATED... THEY CAN ACCESS THE @@VARIABLES DIRECTLY, OK, I GET IT]****

**(4.) What does `attr_accessor` do?**

`attr_accessor :name` creates an instance variable with the name `@name`, a getter method called `name` and a setter method called `name=`

**(5.) What is `Dog.some_method`?**

Since Dog is capitalized, you know it is a class name, so some_method must be a class method... which means it was defined like this:
```
def self.some_method
```
inside the Dog class.

**(6.) Difference between subclassing and mixing in:**

Subclassing means inheriting from a superclass. You do it like this:

```
class BlackAngus < Bovine
```
You can only do that one time, i.e., you can only have one parent. But you can mixin as many modules as you want. [THIS IS CALLED COMPOSITION] To do that, you define your modules like this:

```
module Milkable
```
and mix them in like this:
```
include Milkable
```

**(7.) The Initalize method**

OK, I wasn't really clear on this, but I guess instead of saying: `mary = User.new("Mary")` you can instead say: `User.new("Mary")` Which is why we can launch a game with `Blackjack.new.game`. Is that right?  Anyhow, the question is what would the initialize method look like and it would look like this:

```
class User
  attr_accessor :name
  def initialize(name)
    @name = name

[HMMM... TEACHER DOES IT LIKE THIS:
  self.name = name #INSTEAD OF @name = name
IS THERE A DIFFERENCE?]
```

**(8.) Can you call instance methods...**
...of the same class from other instance methods in that class? Yes, we do that all the time. For example:
```
class Deck
  def evaluate_hand(array_of_cards)...
  def determine_winner
    player.each do |player|
	  evaluate_hand(player.hand)...
```

**(9.) How can you trap errors?**

You should use pry but I haven't really adapted to it yet. Or maybe you are asking about using this:
```
begin
  #something that might cause an error
rescue => e
  puts "there was a problem: #{e.message}
end
```






