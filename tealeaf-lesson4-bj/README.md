# Tealeaf Course 1, Lesson 4: Ajax Blackjack
Mary Dean
11/10/2014
## UNDER CONSTRUCTION ...NOT READY FOR PRIMETIME
This is just a backup of work in progress as I try to convert previous blackjack game to Ajax

## Deployed on Heroku
You should be able to run it from this URL:
https://marydean-blackjack.herokuapp.com

CREDITS: all graphics from openclipart.org
##jQuery and Ajax Fun
Set goal of having it all on a single page. 

Programming is like walking through waist-deep quicksand. You made one step and feel like you are making progress, but the next step is just as hard and slow. 

The hardest place to program is the interface between different programs. I think that's what's good about this class. We could follow along tutorials for jQuery and ruby but getting them to talk is the hard part.

I had a horrible time trying to pass an array to jQuery for the chart. First, the underscore error. My chart takes data points as an array: [1,2,3,4,5]. You would think it would be simple to pass that array from Ruby. And it WAS simple but only after I spent several hours trying a million things. When we pass the array of cards to the session, it is accepted as a straight array, you don't have to .to_s it. But when you pass it to javaScript, as far as I can tell, after a long struggle, you DO have to turn it into a string.  Fine. But when I use alert to read that string, it appears without the quotes 1,2,3,4,5. So (I thought) I needed to interpolate that back into square brackets for my chart. But no. It worked when I just set my chart data like this: data: balanceHistory. So simple! No need to convert the string back into an array, it is already understood as such. ARGH! But what a pleasure to see my line graph suddenly appear at the bottom of the page, powered with real data, transferred from Ruby to JavaScript and jQuery via Ajax! 

Interestingly, when I convert my array to a string to send it to the session, when I do a binding.pry and look at the variable session[:balance_history].class it says "Array" not "String"

The final problem was the graph was disappearing because it was under the button? Luckily doing binding pry let me see the shadow of a graph. Or is it that the erb is redrawn and jquery is disappearing? 

I feel like I am getting closer to the fire. Not sure what that means, but I feel like I am getting somewhere. Most of the time I'm standing out in the cold, but every once in a while my mind makes a connection with the larger world. Like I understand something.
It's hard to even keep track of all the stuff I'm learning these days. It goes in a circle. You learn about jQuery, that leads you to Ajax, that leads you to Javascript, that leads you to JSON, then you go back to HTTP routing, and arrays, and passing arrays via JSON and Ajax into a jQuery library, and Ta Da, a triumph. A graph that updates in real time. 
I wanted to add something fancy to my final blackjack game for this course. I didn't want to just follow the solution videos. So I thought I would make a graphic that shows the player winning or losing money over time. At first I tried a bootstrap "progress bar" but that wasn't it. I wanted a real graph. So I googled "jquery graph" and sure enough, the first thing that popped up was a free jQuery library called Chart.js. It is easy to use and they provide examples of each kind of graph, so that was great. But then I ran into a problem. I can keep track of the player's winnings inside a session cookie, but how do I get that information out of Ruby and into jQuery? I could go down the path of trying to learn to grab the same session variables in Javascript, but the point of this exercise is to use Ajax. OK, so Ajax lets you "GET" a "URL." So I could pass the information from Ruby via a URL, like '/player_balance_history'. 
GET '/player_balance_history' do
  "[50,100,150,100,25,-25,-50,-100]"
  end
  
That worked when I put my array into quotes. 's easy enough. But an array is an object and you can only pass strings. 




This lesson took me a solid month and involved a very steep learning curve for me, but it was also fun and I learned a ton. I found it impossible NOT to go "sideways" in this lesson because there was so much new material: Sinatra, ERB, Bootstrap, HTTP, Heroku, TCP/IP, Mechanize, web forms, css. To make it even more challenging, I decided to bite the bullet and learn to use a Mac for the first time in my life. I felt like I was programming with two left hands. The most basic things like saving files, starting programs, finding things, connecting to a network, were difficult and frustrating. I spent an entire day getting RVM working, for example, and another day learning Unix-style terminal commands. But now I have two monitors on my desk and am able to move files between my Windows PC and my Mac, so I feel like a pro. 

Here's a summary of what I learned in this lesson, besides the actual making of the blackjack game:

* I made my very own "web scraper" using the Mechanize gem, based on the Tealeaf 8/16/14 live session recording. I wanted to find different playing card graphics from those provided by the teacher, and I found a bunch at openclipart.org, but I was faced with right-clicking and downloading 52 image files, so it seemed like a good time to learn to use mechanize. My script was sloppy but it got the job done. It was really amazing to see 52 .png files downloaded and renamed in a matter of seconds. So far I think this is the most 'real-world useful' thing I have learned in this class.

* I spent a day trying very hard to use Ruby to resize my playing cards, but all of the gems that do graphics were difficult to use and many were out of date, so I gave up and used a cute little utility called Faststone Image Resizer.
* I spent a day delving into Bootstrap, which was amazingly productive. I tried to use the 'grid system' to make my user interface, and I can't wait to check out Bootstrap version 3, as well as other frameworks.
* I learned how to run sinatra on my home network so I could develop on one machine and test on another. This is how I think I will always work from now on.
* I learned to use the RubyMine IDE. It was expensive, but once I climbed the learning curve I can't imagine going back. Just being able to click on an ```end``` statement and see what ```do``` it belonged to, or click a ```</div>``` and see what ```<div>``` it belonged to, solved a major frustration I had with using Sublime. And being able to press a single button to stop/restart the sinatra server and run the program saved me tons of time (I couldn't use Shotgun because I was running it over a network). Rubymine is also integrated with Github. I haven't figured out the integration with Heroku yet, but I know it can be done. The only frustrating thing is that it won't allow me to run it on both Mac and PC at same time. If I could, it would be perfect, because my goal is to be fluent in both operating systems.
* I spent a lot of time dinking around with HTML and I found the simple act of trying to get things "centered" to be a major source of frustration. I finally got everything centered in their ```<divs>``` on my home network, but now that it is up on Heroku I see that my 'Dealer' and 'Player' graphics have shifted to the left. For godsakes, Internet Lords, just let us say ```align="center"``` and be done with it! Why should aligning buttons be different than aligning images, fields, paragraphs, divs, table text, or whatever?
* I learned to make and use a favicon. When you play my game you should see a little dollar sign in your web browser tab.
* I really don't like the default behavior of html form fields, when you try to enter your name or a bet and you get a dropdown list of your previous entries. I thought this was a feature of the browser, but it turns out you can turn this off by saying ```<input type="text" autocomplete="off"...>```  I think this makes a form look much neater.
* I learned to add a bootstrap 'icon' to a button (the stars on my "Let's Play Blackjack" button). 
* I am still confused, however, about the difference between buttons as links, buttons as parts of forms, and button as an html element of its own. All three of these are buttons I used in my code. I'm not sure if they are interchangeable or how they differ, but they all work. 
```<a class="btn btn-primary btn-large" href="/set_name">```
```<button type="submit" class="btn btn-primary btn-large">```
```<input type="submit" class="btn btn-warning btn-large" value="Play Dealer's Turn">```
* I was forced to finally learn to use binding.pry to debug things, but I still find it difficult to use. 
* I spent an enormous amount of time trying to figure out why my buttons weren't responding to instance variables. It turned out to be the classic beginner mistake of saying ```if @show_hit_stay_buttons=true``` instead of ```if @show_hit_stay_buttons==true```. Unbelievable that I am still making that mistake! Also, in one of my tests to determine the winner I accidentally referred to ```session[:player_hand]``` instead of ```session[:player_cards]``` and spent hours trying to figure out why the game was crashing intermittantly. Pry didn't help. What did help was going back to the old method of showing my arrays and card values on the screen so I could see what was going on. The lesson here is that it's actually faster to rewrite code from scratch rather than copying it from a past project, or better yet, just decide on your terminology and stick to it across projects. 

Conceptually, I think the biggest mental breakthrough on this lesson, for me, was understanding that ```/game/dealer/hit``` doesn't mean there is a document called 'hit' inside a directory called '/game/dealer/'. In other words, a 'route' doesn't necessarily traverse a folder structure. It's just an arbitrary name, like a method name. This is a new concept for me.  