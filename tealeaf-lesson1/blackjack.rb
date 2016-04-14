# encoding: UTF-8

# Only works if that is first line in file

# Blackjack
# Mary Dean
# 9/13/14

# Using ascii fonts Big Money, Cards, Big, Banner, Calvin
# Other ascii art from www.ascii-art.de

# ****************************************
# BANNERS AND DECORATIONS
#*****************************************

banner_cards =<<END_MARKER
.------..------..------..------..------..------..------..------..------.
|B.--. ||L.--. ||A.--. ||C.--. ||K.--. ||J.--. ||A.--. ||C.--. ||K.--. |
| :(): || :/\\: || (\\/) || :/\\: || :/\\: || :(): || (\\/) || :/\\: || :/\\: |
| ()() || (__) || :\\/: || :\\/: || :\\/: || ()() || :\\/: || :\\/: || :\\/: |
| '--'B|| '--'L|| '--'A|| '--'C|| '--'K|| '--'J|| '--'A|| '--'C|| '--'K|
`------'`------'`------'`------'`------'`------'`------'`------'`------'

END_MARKER

banner_lets_play = <<END_MARKER

╦  ┌─┐┌┬┐┌─┐  ╔═╗┬  ┌─┐┬ ┬
║  ├┤  │ └─┐  ╠═╝│  ├─┤└┬┘
╩═╝└─┘ ┴ └─┘  ╩  ┴─┘┴ ┴ ┴ 

END_MARKER

banner_blackjack = <<END_MARKER
\r\n _______   __                      __         \r\n|       \\ |  \\                    |  \\        \r\n| $$$$$$$\\| $$  ______    _______ | $$   __   \r\n| $$__/ $$| $$ |      \\  /       \\| $$  /  \\  \r\n| $$    $$| $$  \\$$$$$$\\|  $$$$$$$| $$_/  $$  \r\n| $$$$$$$\\| $$ /      $$| $$      | $$   $$   \r\n| $$__/ $$| $$|  $$$$$$$| $$_____ | $$$$$$\\   \r\n| $$    $$| $$ \\$$    $$ \\$$     \\| $$  \\$$\\  \r\n \\$$$$$$$  \\$$  \\$$$$$$$  \\$$$$$$$ \\$$   \\$$  \r\n                                              \r\n                                              \r\n                                              \r\n          _____                      __       \r\n         |     \\                    |  \\      \r\n          \\$$$$$  ______    _______ | $$   __ \r\n            | $$ |      \\  /       \\| $$  /  \\\r\n       __   | $$  \\$$$$$$\\|  $$$$$$$| $$_/  $$\r\n      |  \\  | $$ /      $$| $$      | $$   $$ \r\n      | $$__| $$|  $$$$$$$| $$_____ | $$$$$$\\ \r\n       \\$$    $$ \\$$    $$ \\$$     \\| $$  \\$$\\\r\n        \\$$$$$$   \\$$$$$$$  \\$$$$$$$ \\$$   \\$$\r\n                                              \r\n                                              

END_MARKER

banner_you_won = <<END_MARKER

    ╦ ╦╔═╗╦ ╦  ╦ ╦╔═╗╔╗╔  ┬    
    ╚╦╝║ ║║ ║  ║║║║ ║║║║  │    
     ╩ ╚═╝╚═╝  ╚╩╝╚═╝╝╚╝  o    

END_MARKER

fancy_21 =<<END_MARKER
                                               
                                               
           222222222222222      1111111        
          2:::::::::::::::22   1::::::1        
          2::::::222222:::::2 1:::::::1        
          2222222     2:::::2 111:::::1        
                      2:::::2    1::::1        
                      2:::::2    1::::1        
                   2222::::2     1::::1        
              22222::::::22      1::::l        
            22::::::::222        1::::l        
           2:::::22222           1::::l        
          2:::::2                1::::l        
          2:::::2                1::::l        
          2:::::2       222222111::::::111     
          2::::::2222222:::::21::::::::::1     
          2::::::::::::::::::21::::::::::1     
          22222222222222222222111111111111     
                                               

END_MARKER

banner_house_wins =<<END_MARKER


     #                ## 
    ###              #   
     #              #    
           #####    #    
     #              #    
    ###              #   
     #                ## 
                         

END_MARKER

banner_dealer_wins =<<END_MARKER

╔╦╗┌─┐┌─┐┬  ┌─┐┬─┐  ╦ ╦┬┌┐┌┌─┐
 ║║├┤ ├─┤│  ├┤ ├┬┘  ║║║││││└─┐
═╩╝└─┘┴ ┴┴─┘└─┘┴└─  ╚╩╝┴┘└┘└─┘

END_MARKER

banner_tie =<<END_MARKER

    ______
   /(    )\\
   \\ \\  / /
    \\/[]\\/
      /\\
     |  |
     |  |
     |  |
     |  |
     |  |
     \\  /   
      \\/

END_MARKER

banner_cards =<<END_MARKER
.------..------..------..------..------..------..------..------..------.
|B.--. ||L.--. ||A.--. ||C.--. ||K.--. ||J.--. ||A.--. ||C.--. ||K.--. |
| :(): || :/\\: || (\\/) || :/\\: || :/\\: || :(): || (\\/) || :/\\: || :/\\: |
| ()() || (__) || :\\/: || :\\/: || :\\/: || ()() || :\\/: || :\\/: || :\\/: |
| '--'B|| '--'L|| '--'A|| '--'C|| '--'K|| '--'J|| '--'A|| '--'C|| '--'K|
`------'`------'`------'`------'`------'`------'`------'`------'`------'

END_MARKER

banner_card_hand = %Q{
\r\n                   __\r\n             _..-''--'----_.\r\n           ,''.-''| .---/ _`-._\r\n         ,' \\ \\  ;| | ,/ / `-._`-.\r\n       ,' ,',\\ \\( | |// /,-._  / /\r\n       ;.`. `,\\ \\`| |/ / |   )/ /\r\n      / /`_`.\\_\\ \\| /_.-.'-''/ /\r\n     / /_|_:.`. \\ |;'`..')  / /\r\n     `-._`-._`.`.;`.\\  ,'  / /\r\n         `-._`.`/    ,'-._/ /\r\n           : `-/     \\`-.._/\r\n           |  :      ;._ (\r\n           :  |      \\  ` \\\r\n            \\         \\   |\r\n             :        :   ;\r\n             |           /\r\n             ;         ,'\r\n            /         /\r\n           /         /\r\n                    / 
}



# ****************************************
# HELPER METHODS
#*****************************************

def make_new_deck_of_cards  
  suits = ["hearts", "clubs", "spades", "diamonds"]
  faces = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10","J","Q","K"]
  deck = []
  cards= faces.each do |s|
    suits.each do |f|
      card = "#{s} of #{f}"
      deck.push(card)
    end
  end
  return deck
end

# Take an existing deck and deal out num_cards
# Subtract those cards from the deck
# Return an array with the new cards and the remaining deck
# I SHOULD HAVE USED POP FOR THIS BUT THIS IS HOW I DID IT
def deal_cards(old_deck, num_cards)
  hand = old_deck.sample(num_cards)
  new_deck = old_deck - hand
  return [hand, new_deck]
end

# Add up the value of the cards in a hand
# I ran in circles for a day on this issue
# First I tried returning an array of possible scores
# i.e. Your cards are worth [8,18] if they got an Ace
# Then I valued Aces as 1 and added a second return value
# i.e. Your cards are worth 8 plus one Aces
# That forced me to put the Ace logic into the game play
# Which was too messy. Also, dealing with 2 aces was a nightmare.
# I had it basically working, but then I looked at teacher's
# code and decided to rewrite this whole method
def value_of_hand(array_of_cards)
  faces = {"A" =>11,
         "2" => 2, 
         "3" => 3,
         "4" => 4,
         "5" => 5,
         "6" => 6,
         "7" => 7,
         "8" => 8,
         "9" => 9,
         "10" => 10,
         "J" => 10,
         "Q" => 10,
         "K" => 10
       }
  total_value = 0
  num_aces = 0
  array_of_cards.each do |c|
    #cards are in string format, e.g. "J of diamonds"
    face = c.split[0]
    value = faces[face]
    total_value += value
    num_aces += 1 if face == "A"
    end
   #correct for Aces -- BORROWED THIS LOGIC FROM TEACHER'S CODE
    num_aces.times do
      total_value -= 10 if total_value > 21
    end
  return total_value
end #end value_of_hand



# Lay out the cards and add them up for the user
def explain_the_situation(hand, who)
  v = value_of_hand(hand)
  puts "#{who}'s cards are:  #{hand.join(", ")}"
  puts "They add up to:  #{v}"
end #end of explain_the_situation



# Deal a single card, add it to hand and subtract it from deck
# I know now I should have used POP for this
def hit_me(your_hand, deck, who)
   deal = deal_cards(deck,1)
   new_card = deal[0]
   deck = deal[1]
   puts "==============================="
   drum_roll("#{who} hits...", false)
   puts "\n==============================="
   puts "The new card is a #{new_card[0]}."
   your_hand = your_hand + new_card
   return [your_hand, deck]
end


# Make text appear slowly on screen to built drama
def drum_roll(dramatic_text, beep)
  print "\a" unless beep == false
  c = 0
  dramatic_text.length.times do
  print dramatic_text[c]
  c += 1
  sleep 0.05
end
end

# Ask if they want to play again
def play_again?(username, banner_cards, banner_lets_play)
    puts "Would you like to play again? (y/n)"
    choice = gets.chomp[0].downcase
    if choice == "n"
      puts "\n\n"
      puts "Thank you, #{username}, for visiting".center(70)
      puts "Mary's Magnificent Emporium of Blackjack".center(70)
      puts banner_cards
       puts "\n\n"
      exit
    else
      puts banner_lets_play
      return choice
    end
  end


# ****************************************
# GAME STARTS HERE
#*****************************************

puts "

   Welcome to Mary's Magnificent Emporium of"

puts banner_blackjack

puts "      We are so glad you could come!\n\n"
puts "     Tell us your name, lucky player!\n\n"

username = gets.chomp

puts banner_card_hand

deck = make_new_deck_of_cards

######################
# START OF MAIN LOOP
######################

keep_playing = "y"
while keep_playing == "y" 
puts "Excellent, #{username}! Let's get started!\n\n"
deal = deal_cards(deck,2)
drum_roll("Dealer is shuffling. . . dealing. . . ", false)

#parse the deal into newly dealt cards vs. the deck that is left
your_hand = deal[0]
deck = deal[1]
puts "\n\n"

# Explain the situation
explain_the_situation(your_hand, username)
v = value_of_hand(your_hand)

#If user gets a blackjack, no need to continue
if your_hand.length ==2 && v == 21
  puts "\n\nHey! That's a blackjack!"
  puts fancy_21
  #no need to ask if hitting or staying
  choice = 's'
  keep_playing = play_again?(username, banner_cards, banner_lets_play)
end

# Otherwise, hit or stay?
choice = "h"
while choice == "h"
  puts "\nWhat would you like to do? (H)it or (S)tay?"
  choice = gets.chomp[0].downcase
  
    if choice == "s"
    puts "You have chosen to stay at #{v}"
  
  elsif choice == "h"
   new_situation = hit_me(your_hand, deck, username)
   your_hand = new_situation[0]
   deck = new_situation[1]
   explain_the_situation(your_hand, username)
   v = value_of_hand(your_hand)
   if v > 21
     puts "\nOh, too bad! You have gone over!"
     puts banner_house_wins
     keep_playing = play_again?(username, banner_cards, banner_lets_play)
     break
  else
    next
  end
end

puts "==============================="
drum_roll("DEALER'S TURN", false)
puts "\n==============================="
drum_roll("Dealer deals two cards...", false)
dealer_deal = deal_cards(deck,2)
dealer_hand = dealer_deal[0]
deck = dealer_deal[1]
explain_the_situation(dealer_hand, "Dealer")
dealer_value = value_of_hand(dealer_hand)

if dealer_hand.length == 2 && dealer_value == 21 
  puts "\nOh, rotten luck!  Dealer got a BLACKJACK!"
  puts banner_dealer_wins
  puts "There are #{deck.count} cards left in the deck."
  keep_playing = play_again?(username, banner_cards, banner_lets_play)
  break
end #end if

if dealer_value < 17
  while dealer_value<17
    puts "Since dealer cards are worth less than 17 she is forced to hit."
    dealer_hit = hit_me(dealer_hand, deck, "Dealer")
    dealer_hand = dealer_hit[0]
    deck = dealer_hit[1]
    explain_the_situation(dealer_hand, "Dealer")
    dealer_value = value_of_hand(dealer_hand)       			
    end #end of while
end #end of if

puts "==============================="
drum_roll("AND THE WINNER IS...", false)
puts "\n==============================="

if dealer_value > 21
 	puts "Dealer has gone over 21. She loses."
 	puts banner_you_won
end

if dealer_value <= 21 && dealer_value == v
  puts "Dealer's value is #{dealer_value} and your value is #{v}"
  puts "Looks like we have a tie!"
  puts banner_tie
end

if dealer_value <= 21 && dealer_value > v
  puts "Dealer's value is #{dealer_value} and your value is #{v}"
  puts banner_dealer_wins
end

if dealer_value <= 21 && dealer_value < v
  puts "Dealer's value is #{dealer_value} and your value is #{v}"
  puts banner_you_won
end
if deck.count<=8
  puts "We're sorry, there are not enough cards in the deck to continue"
  puts "\n\n"
  puts "Thank you, #{username}, for visiting".center(70)
  puts "Mary's Magnificent Emporium of Blackjack".center(70)
  puts banner_cards
  puts "\n\n"
  keep_playing = 'n'
  exit
end
puts "There are #{deck.count} cards left in the deck."
keep_playing = play_again?(username, banner_cards, banner_lets_play)

end
end # end of giant while clause
