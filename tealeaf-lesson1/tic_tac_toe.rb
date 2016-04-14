# encoding: UTF-8
# Only works if that is first line in file

# Tic-Tac-Toe
# Mary Dean
# 9/12/14

# Using ascii fonts Digital and Calvin S

intro = <<END_MARKER

 +-+-+-+-+-+ +-+-+-+-+  
 |L|E|T|'|S| |P|L|A|Y|  
 +-+-+-+-+-+-+-+-+-+-+-+
 |T|I|C| |T|A|C| |T|O|E|
 +-+-+-+ +-+-+-+ +-+-+-+

END_MARKER

fancy_you = <<END_MARKER
    ╦ ╦╔═╗╦ ╦  ╔╦╗╦╔╦╗  ╦╔╦╗  ┬
    ╚╦╝║ ║║ ║   ║║║ ║║  ║ ║   │
     ╩ ╚═╝╚═╝  ═╩╝╩═╩╝  ╩ ╩   o
    ╦ ╦╔═╗╦ ╦  ╦ ╦╔═╗╔╗╔  ┬    
    ╚╦╝║ ║║ ║  ║║║║ ║║║║  │    
     ╩ ╚═╝╚═╝  ╚╩╝╚═╝╝╚╝  o    
END_MARKER

fancy_computer = <<END_MARKER


╔═╗╔═╗╔╦╗╔═╗╦ ╦╔╦╗╔═╗╦═╗  ┬  ┬  ┬
║  ║ ║║║║╠═╝║ ║ ║ ║╣ ╠╦╝  │  │  │
╚═╝╚═╝╩ ╩╩  ╚═╝ ╩ ╚═╝╩╚═  o  o  o


END_MARKER

#p stands for 'positions'. I will start with them filled in
#so the user can see how the squares are numbered

p = {1 =>"1",
     2 =>"2",
     3 =>"3",
     4 =>"4",
     5 => "5",
     6 => "6",
     7 => "7",
     8 => "8",
     9 => "9"
     }

# redraw the game board with 9 array elements

def redraw_board(p)
puts "           |       |     "
puts "        #{p[1]}  |   #{p[2]}   |   #{p[3]}     "
puts "           |       |     "
puts "    +-+-+-+ +-+-+-+ +-+-+-+ "
puts "           |       |     "
puts "        #{p[4]}  |   #{p[5]}   |   #{p[6]}     "
puts "           |       |     "
puts "    +-+-+-+ +-+-+-+ +-+-+-+ "
puts "           |       |     "
puts "        #{p[7]}  |   #{p[8]}   |   #{p[9]}     "
puts "           |       |     "
end

# I have to use space rather than blank to keep the board neat
def zero_out_positions(p)
  p.each do | k, v |
    p[k] = " "
  end
end

# For some reason this works better than rand(range)
def random_int(min, max)
    rand(max - min) + min
end

# this will return available spots... the spots that are " "
def available_spots(p)
  p.select {|k,v| v == " "}.keys
end

# validate user's choice of spot
# it can only be 1-9 AND must be available
def spot_valid?(s, p)
  if 
    !["1","2","3","4","5","6","7","8","9"].include?(s) 
    puts "You must choose a number between 1 and 9."
    puts "You lose your turn."
  elsif 
    !available_spots(p).include?(s.to_i)
    puts "\nThat spot is already taken."
    puts "\n    You lose your turn!"
  else
    return true
end
end

# is there a winner?  if so, return name of winner

def and_the_winner_is(player1token, player2token,p)
  winning_lines = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]
  #took that from teacher's code
  winning_lines.each do |line|
    return "Player 1" if p.values_at(*line).count(player1token) == 3
    return "Computer" if p.values_at(*line).count(player2token) == 3
  end
  false
end

# drum roll
def drum_roll(dramatic_text, beep)
  print "\a" unless beep == false
  c = 0
  dramatic_text.length.times do
  print dramatic_text[c]
  c += 1
  sleep 0.05
end
end

# I let the user choose his own game piece character.
# To make sure the computer doesn't use same character, 
# I made it randomly choose from these less common symbols
token_choice = 
    {section: "\xc2\xa7",
    registered: "\xc2\xae",
    copyright: "\xc2\xa9",
    pilcrow: "\xc2\xb6",
    yen: "\xc2\xa5",
    pound: "\xc2\xa3"}




#****************************
# START OF GAME
#****************************


puts intro

puts "Why limit ourselves to X's and O's?
Choose any character on your keyboard (except space) 

Enter your game piece: "
player1token = gets.chomp[0]

# Don't allow space character as game piece
if player1token.chr == "\x20"  
  puts "I'm sorry, SPACE is not a valid choice"
  puts "Since you are not cooperating, this game will end"
  exit
end

# Computer chooses its own game piece from list above
player2token = token_choice.values[rand(0..5)]
print "\n  OK, you will be #{player1token}. The computer chooses"
drum_roll("... ", false)
puts player2token

# Explain rules of game
puts "\n"
puts "       Excellent! You can go first."
puts "\nOur board is numbered like this:\n"
redraw_board(p)
zero_out_positions(p)

# Start the loop that will allow us to take turns
# until a winner emerges
winner = false
while winner == false
puts "\n  Which spot would you like to play?\n"
s = gets.chomp[0]

# see if the user's choice is valid, and then apply it
if spot_valid?(s,p) 
  p[s.to_i]=player1token
end

# see what spots are still available for computer to choose from,
# and choose one at random. If none are available and there is
# no winner, then you must have a tie.

# Obviously, you would want some intelligence to be built
# into this section because currently the computer is choosing
# random slots and can always be beaten.

a = available_spots(p)

if a.length > 0
  player2spot = a[random_int(1,a.length)]
  p[player2spot]=player2token
else
  puts "No more spaces available ;-("
  puts "Looks like we had a tie"
  puts "No one will win the $1 Million prize"
  exit
end

# Redraw the board with two new game pieces added

print "\n    You chose #{s} . . . Computer chooses"
drum_roll(" . . . ", false)
puts player2spot
puts "\n\n"
redraw_board(p)

# Announce the winner if there is one
# Otherwise loop back up to the top of the while loop

winner = and_the_winner_is(player1token, player2token,p)

unless winner == false 
  puts "\n... Ladies and Gentlemen... We have a WINNER!"
  drum_roll("\n... and the winner is...", true)
  puts "\n\n"
  puts winner == "Player 1" ? fancy_you : fancy_computer
  puts "\n   Thank you for playing TIC-TAC-TOE!"
end
#end of WHILE LOOP
end

