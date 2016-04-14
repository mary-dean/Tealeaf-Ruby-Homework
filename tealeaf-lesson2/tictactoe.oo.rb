# encoding: UTF-8
# Mary Dean
# Tealeaf Course 1 Lesson 2
# Object oriented tic tac toe

# Cool Features
# Coin toss to determine who goes first
# Special effects module  

# Issues I would address if I had infinite time:
# 1. It doesn't handle a tie
# 2. It clears the screen too quickly if the computer wins the coin toss
# 3. It doesn't ask if you want to play again
# 4. It doesn't keep score

# ================================
#       module SpecialEffects
# ================================

module SpecialEffects

  def drum_roll(dramatic_text)
    c = 0
    dramatic_text.length.times do
      print dramatic_text[c]
      c += 1
      sleep 0.04
    end
  end

  def clear_screen
     # It works on Windows to include both of these
     # Don't know how it will work on Macs
    system 'cls'
    system 'clear'
  end

  def show_intro
    puts %Q[

      +-+-+-+-+-+ +-+-+-+-+  
      |L|E|T|'|S| |P|L|A|Y|  
      +-+-+-+-+-+-+-+-+-+-+-+
      |T|I|C| |T|A|C| |T|O|E|
      +-+-+-+ +-+-+-+ +-+-+-+

]
    end

    def show_you_win
      puts %Q[

    ╦ ╦╔═╗╦ ╦  ╔╦╗╦╔╦╗  ╦╔╦╗  ┬
    ╚╦╝║ ║║ ║   ║║║ ║║  ║ ║   │
     ╩ ╚═╝╚═╝  ═╩╝╩═╩╝  ╩ ╩   o
    ╦ ╦╔═╗╦ ╦  ╦ ╦╔═╗╔╗╔  ┬    
    ╚╦╝║ ║║ ║  ║║║║ ║║║║  │    
     ╩ ╚═╝╚═╝  ╚╩╝╚═╝╝╚╝  o    
]
end

  def show_you_lose
  puts %Q[
 _____             _               _ _ 
|_   _|           | |             | | |
  | | ___   ___   | |__   __ _  __| | |
  | |/ _ \\ / _ \\  | '_ \\ / _` |/ _` | |
  | | (_) | (_) | | |_) | (_| | (_| |_|
  \\_/\\___/ \\___/  |_.__/ \\__,_|\\__,_(_)
                                       
                                       
__   __            _                   
\\ \\ / /           | |                  
 \\ V /___  _   _  | | ___  ___  ___    
  \\ // _ \\| | | | | |/ _ \\/ __|/ _ \\   
  | | (_) | |_| | | | (_) \\__ \\  __/   
  \\_/\\___/ \\__,_| |_|\\___/|___/\\___| 
]
end

  def show_coin
    puts %Q[
      
         ..-"""""-..
       .'    ___    '.
      /    ."\\  `\\    \\
     ;    /, (    |    ;
    ;    /_   '._ /     ;
    |     |-  '._`)     |
    ;     '-;-'  \\      ;
     ; """" /    \\\\    ;
      \\    '.__..-'   /
       '._ 2 0 1 4 _.'
          ""-----""

]
end

#This is the only way I have figured out to get
#these functions OUT of this module without including
#the entire thing in each class. I now think I was
#misunderstanding the purpose of modules and next
#time I will put these into a SpecialEffects Class 
#and make them class level methods
module_function :drum_roll
module_function :clear_screen
module_function :show_intro
module_function :show_you_win
module_function :show_you_lose
module_function :show_coin

end #end module SpecialEffects


# ================================
#       class Player
# ================================

class Player
  #I tried making @@tokens_available a class variable
  # but I couldn't get it to work
  attr_accessor :type, :name, :token
  #is it kosher to ask for info inside of initialize?
  def initialize(type)
    @type = type
    @name = 
      if @type == "human"
        puts "\nPlease enter your name, lucky player:"
        gets.chomp
      else
        nemesis_names = [
        "The Strangulator", 
        "Tic Tac Terminator",
        "Doomsday Derrick",
        "Tanya Ticky Tacky",
        "Chris Cross",
        "The Game Meister",
        "Tom the Time Bomb",
        "The 3x3 Grid Zombie",
        "Squirrel"]  
         nemesis_names.sample
      end
    @token = 
      if @type == "human"
        puts "\nPlease select a game token, such as X, O, @, $, @ etc. "
        gets.chomp[0]
      else
         {section: "\xc2\xa7",
          registered: "\xc2\xae",
          copyright: "\xc2\xa9",
          pilcrow: "\xc2\xb6",
          yen: "\xc2\xa5",
          pound: "\xc2\xa3"}.values[rand(0..5)]
      end      
    end #of initializer

  def to_s
    "[#{@type}, #{@name}, #{@token}]"
  end

  def increment_score
    @wins += 1
  end

end #of class Player

# ================================
#       class TicTacToe
# ================================
class TicTacToe
 include SpecialEffects
	def initialize
		# p is for positions.
		# start by labeling each spot 
		@p = {"1" =>"1",
	     "2" =>"2",
	     "3" =>"3",
	     "4" =>"4",
	     "5" => "5",
	     "6" => "6",
	     "7" => "7",
	     "8" => "8",
	     "9" => "9"
	     }
	  end

    def intro
      clear_screen
      show_intro
      puts "\n      Welcome to Tic Tac Toe!\n\n"
    end
  
  def draw_board(clear_first)
    if clear_first 
      clear_screen
    end
    puts "           |       |     "
    puts "        #{@p["1"]}  |   #{@p["2"]}   |   #{@p["3"]}     "
    puts "           |       |     "
    puts "    +-+-+-+ +-+-+-+ +-+-+-+ "
    puts "           |       |     "
    puts "        #{@p["4"]}  |   #{@p["5"]}   |   #{@p["6"]}     "
    puts "           |       |     "
    puts "    +-+-+-+ +-+-+-+ +-+-+-+ "
    puts "           |       |     "
    puts "        #{@p["7"]}  |   #{@p["8"]}   |   #{@p["9"]}     "
    puts "           |       |     "
  end

  #once they have seen the labels, remove them and redraw board
  #however, I like madcalf's way of leaving the numbers in place
  #until they are used. Will do that next time.
  def zero_out_board
    @p.each { |k, v| @p[k] = ' '}
    draw_board(true)
  end 
  
  def available_spaces
	  @p.select {|k,v| v == " "}.keys
	end

  def add_token_to_board(space, token)
    @p[space] = token
  end


  def introduce_players(p1, p2)
    phrase = [
      "Your opponent will be...",
      "You will be playing against...",
      "Your nemesis will be ...",
      "You will be competing against..."].sample
      drum_roll("\nNice to meet you, #{p1.name}. Your token will be #{p1.token}")
      puts "\n"
      drum_roll("#{phrase} #{p2.name.upcase}!")
      puts "\n"
      drum_roll("#{p2.name} will be using this token: #{p2.token}. Let's see who goes first.")

    end #of introduce_players

  def flip_a_coin
    sides = ["heads", "tails"]
    return sides.sample
  end

  def decide_who_goes_first(p1, p2)
    show_coin
    drum_roll("Please choose (h)eads or (t)ails")
    puts "\n"
    response = gets.chomp[0].downcase
    side = flip_a_coin
    clear_screen
    if !["h","t"].include?(response)
        drum_roll("Since you are not cooperating, #{p2.name} will go first.")
        puts "\n"
        first_player = p2
      elsif response == side[0]
        drum_roll("It was #{side}... You get to go first, #{p1.name}!")
        puts "\n"
        first_player = p1
      else 
        drum_roll("Too bad, it was #{side}. #{p2.name} will go first.")
        puts "\n"
        first_player = p2
      end #of if statement
    second_player = [p1, p2] - [first_player]
    [first_player, second_player].flatten    
  end #end of def

  def show_instructions
    puts "This is the game board. Note how the squares are numbered."
    puts "Are you ready? Press Enter to start the game..."
    gets
  end

  def take_turn(who)
     a = available_spaces
     if who.type == "human"
           drum_roll("Choose an available square, #{who.name}")
           puts "\n"
           begin
           s = gets.chomp[0]
           end until a.include?(s)
       else
          s = a.sample
       end  #of if statement
      add_token_to_board(s,who.token)
      draw_board(true)
      drum_roll("#{who.name} has chosen space #{s}. . .")
      puts "\n"
      check_for_winner(who)
   end #of take_turn

  def declare_winner(who)
      puts "Ladies and Gentlemen we have a winner!"
      puts "#{who.name} is the new champion!"
      if who.type == "computer" 
        show_you_lose
      elsif who.type == "human"
        show_you_win
      else
        #deal with tie
      end
      puts "I am too sleepy to ask you to play again. Time to move on to blackjack!"
      exit
  end

  def check_for_winner(who)
        winning_lines = [["1","2","3"], ["4","5","6"], ["7","8","9"], ["1","4","7"], ["2","5","8"], ["3","6","9"], ["1","5","9"], ["3","5","7"]]
      winning_lines.each do |line|
      if @p.values_at(*line).count(who.token) == 3 
      declare_winner(who)
      end #of if
    end #of each do
  end #of def
end #end class TicTacToe

# ================================
#       class PlayTicTacToe
# ================================

class PlayTicTacToe
  #I learned... 'SpecialEffects' does NOT go in quotes!
  #Not clear on extend vs include vs require but this works
  #extend SpecialEffects
  #I learned... you don't say SpecialEffects.intro! You say self.intro
  #but that takes away from its descriptive nature
  #Later I took this out and put all special effects in TicTacToe class
  #show_intro
  game = TicTacToe.new
  game.intro
  p1 = Player.new("human")
  p2 = Player.new("computer")
  game.introduce_players(p1,p2)
  #decide_who_goes_first returns an array such as ["human", "Penelope Jones"]
  #that way I don't have to keep looking up their names
  #the join is to extract the name from the square brackets
  order_of_players = game.decide_who_goes_first(p1, p2)
  first_player = order_of_players[0]
  second_player = order_of_players[1]
  #God, this took me an hour to figure out! How to choose the "other" player from a hash
  #and return both the key and value of the OTHER player
  #I know I should work with array here but I wanted to play with hashes
  game.draw_board(false)
  game.show_instructions
  game.zero_out_board
  while game.available_spaces.length > 0 do
    game.take_turn(first_player)
    game.take_turn(second_player)
  end
  #game.zero_out
  #game.draw
end

PlayTicTacToe  