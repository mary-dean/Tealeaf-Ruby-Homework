# Tealeaf Course 1, Lesson 1 #
Mary Dean
9/10/2104

## Fancy Calculator
What I learned


* I am trying to push myself to actually use all the things I have learned in the Precourse and elsewhere. I have a bad habit of getting stuck at the 'advanced beginner' level in everything I do, whether it's playing an instrument or learning a language, so I am going to make a concerted effort to throw in loops, arrays, hashes, string manipulation, and the whole kitchen sink at every exercise. 
* To that end, I made a fancy calculator that uses a case statement, a loop, handles an error, uses the Math class, and has a bit of pizzazz in the user interface. 
* By googling 'ascii generator' I found a site that generates graphical fonts like this:

```

  .oooooo.         .o.       ooooo          .oooooo.   
 d8P'  `Y8b       .888.      `888'         d8P'  `Y8b  
888              .8"888.      888         888          
888             .8' `888.     888         888          
888            .88ooo8888.    888         888          
`88b    ooo   .8'     `888.   888       o `88b    ooo  
 `Y8bood8P'  o88o     o8888o o888ooooood8  `Y8bood8P'  
                                                       
```
I don't get why certain graphics don't work, however. I thought all ascii graphics were based on monotype fonts. But this is what happens to some fonts when the program is run: 
```
Original:
   ____     _       _        ____  
U /"___|U  /"\  u  |"|    U /"___| 
\| | u   \/ _ \/ U | | u  \| | u   
 | |/__  / ___ \  \| |/__  | |/__  
  \____|/_/   \_\  |_____|  \____| 
 _// \\  \\    >>  //  \\  _// \\  
(__)(__)(__)  (__)(_")("_)(__)(__) 

Messed up:
   ____     _       _        ____
U /"___|U  /"  u  |"|    U /"___|
| | u   / _ / U | | u  | | u
 | |/__  / ___   | |/__  | |/__
  ____|/_/   _  |_____|  ____|
 _// \  \    >>  //  \  _// \
(__)(__)(__)  (__)(_")("_)(__)(__)

```
* Oh, another thing I learned is that Ruby returns 'Infinity' if you divide by a zero that is a float rather than an integer. This confused me because I was testing my calculator and I was deliberately dividing by zero in order to throw an exception and suddenly it started returning 'Infinity' instead of an error. It seemed like Ruby was joking.

## Rock, Paper, Scissors ##

* I had fun with this game. The logic was very easy so I could concentrate on playability. I see, however, that my ascii fonts are not showing up so well in Markdown. 

	    > ╦  ┌─┐┌┬┐┌─┐  ╔═╗┬  ┌─┐┬ ┬  
	    > ║  ├┤  │ └─┐  ╠═╝│  ├─┤└┬┘  
	    > ╩═╝└─┘ ┴ └─┘  ╩  ┴─┘┴ ┴ ┴   
	    > ╦═╗┌─┐┌─┐┬┌─
	    > ╠╦╝│ ││  ├┴┐
	    > ╩╚═└─┘└─┘┴ ┴
	    > ╔═╗┌─┐┌─┐┌─┐┬─┐   
	    > ╠═╝├─┤├─┘├┤ ├┬┘   
	    > ╩  ┴ ┴┴  └─┘┴└─   
	    > ╔═╗┌─┐┬┌─┐┌─┐┌─┐┬─┐┌─┐
	    > ╚═╗│  │└─┐└─┐│ │├┬┘└─┐
	    > ╚═╝└─┘┴└─┘└─┘└─┘┴└─└─┘
	    > 

* I added score-keeping, an audible bell (puts \a), and a loop so you can play again and again. 

## Tic Tac Toe ##

* I sure hope we weren't supposed to build any intelligence into this game. I just told the computer to choose random spaces.
* I ran into a lot of issues. Many times, I forgot to use == and instead used = to see if something was equal to something else. I hope this eventually becomes second nature.
* I thought anything could be a symbol, but it appears that you cannot use integers as symbols. I first tried to create my hash like this:  {1: "1", 2: "2",...} but nothing worked until I got rid of the colons and just used pure integers, rather than integer-symbols.
* Using pure integers turned out to be a hassle, too, because every time I got input from the user, it was a string, which I had to convert to an integer, but remember NOT to do that when the computer chose a number. There is another problem with using integers as hash keys. It makes them look like simple arrays. positions[3] looks like an array element, but it is actually a hash calling the key 3.  I would have been better off with string-based keys.
* Once again I ran into scoping issues. But I am starting to get the hang of handing off arguments to parameters, and returning things to the calling method. Which leads to a question: is it considered bad form to use the same name for an argument and a parameter? If I am processing an array called "widgets" would it be acceptable to define my method as process(widgets) then call that method with process(widgets)? For me it makes it easier because in both cases I'm talking about the same thing, but I can see how the readability of the code could suffer.
* I like to have the computer make random choices within a range, but sometimes it didn't seem to work when I said `rand(1..(choices_remaining.length))`.  Sometimes the computer would draw a blank, so to speak. On stack overflow I found this variation: `rand(max - min) + min` and for some reason that seems to work better. Other people seem to be using: `myArray[rand(myarray.length)]`so maybe I don't even need the range. And then there's `myArray.shuffle.first` which is clever, but not memory efficient. Well, all of that was blown away by the simplest solution, which was used by the teacher: 
```ruby
      position = empty_positions(board).sample
```
What a great discovery! **sample** is exactly what I have needed in several situations already. It also accepts an argument in case you want a number of random samples.
* I found it disconcerting to have the computer's game play happen in microseconds, so I slowed it down by creating a method called "drum_roll". This makes it seem like the computer is really thinking before making a choice. 
* I don't know if this was the most logical way to do it, but I decided to select the "spots remaining" after each turn and let the computer only choose from that array. That seemed easier than comparing each new choice to the half-filled array to see if that spot had been filled yet. I think it worked nicely. 
* I went down a rabbit hole learning about methods called .blank? and .present? only to discover that they are RAILS methods and not Ruby methods. 
* I learned a little more about UTF-8 encoding. It turns out that Ruby 2.0 will have UTF-8 by default, so it does not hurt me to be forcing it on my 1.9 programs by having the first line say #encoding: UTF-8.  I don't quite get the # sign. It usually means "comment" but obviously not here. I learned how to produce exotic characters like ¶ and © and § using UTF-8 codes like "\xc2\xa9".
* The whole business of splitting your logic into methods can get messier than I expected. For example, I had a method to validate a user's choices of spot on the grid. It had to pass two tests: (1.) be an integer between 1 and 9, and (2.) to be available, i.e. not filled previously. That led me to create another method to determine which slots were indeed available. That made me think the two validations should have been done separately, and the second merged with the "is available?" code. There seems to be two ways of approaching the matter. Either have lots of little methods, or a few large, complex methods. The problem with lots of little methods is that you end up passing entire arrays back and forth, which can't be very efficient. 
* I was lost on the logic of determining a winner. I think it would have taken me a half-day to figure out, and I would have approached it with brute force ("if a1 is X and a2 is X and a3 is X) OR (if a1 is X and b1 is and C1 is X) etc. So I peeked at the solution code. And I found this:
```ruby
def check_winner(board)
  winning_lines = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]
  winning_lines.each do |line|
    return "Player" if board.values_at(*line).count('X') == 3
    return "Computer" if board.values_at(*line).count('O') == 3
  end
  nil
end
```
That little nugget (the "splat") was a very nice reward for spending an entire day working on a tic tac toe game. 

* I also found this part interesting:
```ruby
  winning_lines.each do |line|
    return "Player" if board.values_at(*line).count('X') == 3
    return "Computer" if board.values_at(*line).count('O') == 3
  end
```
Having several return statements in a row like that... much better than if/then/elsif/else

* Finally, the "begin...end" loop in the teacher's code threw me. It seemed like a loop out of nowhere, with no `loop`, no `while`, no `each`, no `do`, but luckily I kept good notes during the precourse and was able to peg it as the mysterious "do while" loop which contains neither a do or a while.  A better name is needed for that, don't you think?  

## Procedural Blackjack ##
Well, that was a challenge!

The hardest part was dealing with the aces. First I tried calculating each Ace as 1 point and adding a tag like this:

    Your cards are 5 of Hearts, Ace of Spades, Ace of Clubs.
    Your total is 7 with 2 aces

Then I tried calculating an array of possible totals and passing that back to the player. 

    Your cards are 5 of Hearts, Ace of Spades, Ace of Clubs.
    Your total is 7 or 17 or 27

This created a mess as I attempted to separate out the Aces and deal with them using nested if statements. After all, someone could conceivably receive 4 aces in a single hand. Also, the value of the Ace can CHANGE from 11 to 1 depending on the other cards, so you can't just keep adding new cards to the score. I found this very frustrating and spent much more time than I should have on it before finally surrendering and taking a peek at the solution. So elegant. So simple! 

The logic of Ace-handling was the only code that I borrowed. I did everything else by myself, which you can surmise from the novel-like length of my program. 

I created another problem for myself by using the **.sample** method instead of the **.shuffle** and **.pop** methods for dealing cards. This was pure stubbornness on my part. I had just discovered '.sample' which grabs a random card from the deck, and I wanted to use it. I thought it would be more efficient than shuffling, but I hadn't considered two things: first, you only have to shuffle once, and secondly, pop takes care of depleting the deck for you!  Instead, I created a 'deal_card' method that randomly selected any number of cards from the deck, and returned BOTH the cards AND the entire remaining deck to you back in a single array. This meant that I had to use 'deal[0] to access the new hand and deal[1] to access the remaining deck, and this worked, but got messier and messier because each time I had to pass the entire deck back for processing, which was not efficient at all!  I am glad I followed that path, however, because I became much more confident at using nested arrays. 

Another issue I ran into is the basic issue of messiness and organization. It is really easy for things to spin out of control, so you end up with a bunch of 'end' statements and you have no idea what block or loop they belong to. Sometimes, when Ruby said 'Expecting End statement' I would throw on another 'end' and it would work, even though I had no idea what the 'end' belonged to. Something I noticed the teacher doing in the video is adding the 'end' right as he created each loop. That sounds like a good practice. Also, I think it might be even worth adding a comment to each 'end' statement, just to stay organized: 
```ruby
      end # end of IF statement
    end #end of CASE statement"
  end # end of main WHILE loop

```
I found some cute ascii graphics like this (should look like a hand of cards):

```ruby

                   __
             _..-''--'----_.
           ,''.-''| .---/ _`-._
         ,' \ \  ;| | ,/ / `-._`-.
       ,' ,',\ \( | |// /,-._  / /
       ;.`. `,\ \`| |/ / |   )/ /
      / /`_`.\_\ \| /_.-.'-''/ /
     / /_|_:.`. \ |;'`..')  / /
     `-._`-._`.`.;`.\  ,'  / /
         `-._`.`/    ,'-._/ /
           : `-/     \`-.._/
           |  :      ;._ (
           :  |      \  ` \
            \         \   |
             :        :   ;
             |           /
             ;         ,'
            /         /
           /         /
                    / 

```

at various 'asciiart' websites and I think they add a lot to the feeling of interactivity of my program. I managed to flummox myself unnecessarily thinking that some of my graphics didn't show up properly because of encoding issues when really the problem was simply that I needed to 'escape' my backslashes. Oh, well, at least I learned something about encoding, particularly that Ruby 2.0 will use UTF-8 encoding by default, which I believe will make it easier to use accented characters and so forth.

I learned a lot about making helper methods and I very much look forward to learning how to use instance variables because it is very annoying to have to pass things back and forth -- entire decks of cards, entire ascii graphics -- because the methods couldn't access them otherwise. In particular, I am proud of my "drum_roll" method, which I use very frequently. It spells out words with a few milliseconds of delay in order to make it seem like the computer is thinking, or the dealer is actually dealing, instead of having the cards instantly appear. I even added a second parameter to add an audible beep. The only problem is that the output always appears on a separate line, it always does a 'puts' rather than a 'print', I guess because it is a method, so it doesn't work to add a delay the middle of a sentence, like:


    The dealer is dealing...(delay)... Ace of Clubs!

But I don't think I should bother learning how to add more interactivity to 'procedural' programs when we are about to graduate to real objects. 

So, I found this project to be pretty fun and I am pleased with the result. I know I left few logical flaws ... For example, currently the player plays an entire hand, and THEN the dealer gets her cards. What if the player AND the dealer get blackjack? In my game, the dealer never gets that chance. Also, what if you run out of cards? Currently it will go into an endless 'hit' loop because the dealer never reaches 17. Also, I would like to keep score. But I spent too much time on this project and I know we will be making more blackjack games in the future, so I am not going to work on this one any longer.

Onward to Lesson 2! 

