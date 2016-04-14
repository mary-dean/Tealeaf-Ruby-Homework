# Rock Paper Scissors  -- OOP VERSION
# Mary Dean
# 9/19/14

# I don't think you can call this OOP but at least I learned
# to use @variables instead of passing parameters back and forth

class RockPaperScissors
  WEAPONS = ["ROCK", "PAPER", "SCISSORS"]
  
  # I did not use attr_accessor because nothing is interacting with outsiders, correct?
  
  def initialize
    @player1wins = 0
    @player2wins = 0
    @ties = 0
  end

  def get_player_names
    puts "\nEnter your name:"
    @player1 = gets.chomp
    puts "\nChoose a name for your enemy:"
    @player2 = gets.chomp
  end

  def choose_weapons
    puts "     \n#{@player1}, Please choose your implement of destruction:\n"
    puts "     (R)ock, (P)aper, or (S)cissors... then press Enter\n\n"
    choice = gets.chomp[0].downcase
    @player1_weapon = case choice[0]
      when "r"
        WEAPONS[0]
      when "p"
        WEAPONS[1]
      when "s"
        WEAPONS[2]
      else
        print "\a"
        print "\a"
        puts " ? ? ? ? ? ? "
        puts "\nFool! Your only choice was Rock, Paper, or Scissors"
        puts "Because you failed to pick a weapon, you have been killed"
        #what I really want to do here is break out of the while loop
        #but neither 'break' nor 'next' works here.
        @winner = @player2
        announce_winner
        increment_score
        announce_score
        puts "\nAnd #{@player1} is dead.\n\n"
        exit        
      end      
    @player2_weapon = WEAPONS.sample
  end

  def adjective
    arr = ["horrid", "dangerous", "monstrous", "wicked", "frightening", "vicious", "terrible",
            "fearful", "deadly" , "dreaded", "treacherous", "evil", "villainous", "nefarious",
            "nasty", "brutal", "disgusting", "vile", "foul", "nasty", "barbarous", "malevolent"]
    arr.sample 
  end

  def announce_weapons
    p1 = @player1
    p2 = @player2
    w1 = @player1_weapon
    w2 = @player2_weapon
    drum_roll("   #{p1} will be wielding the #{adjective} #{w1}.", false)
    puts
    drum_roll("      While #{p2} counter-attacks with the#{w1 == w2 ? ", um, equally " : " "}#{adjective} #{w2}", false)
  end

  def drum_roll(dramatic_text, beep)
    print "\a" unless beep == false
    c = 0
    dramatic_text.length.times do
      print dramatic_text[c]
      c += 1
      sleep 0.04
    end
  end

  def determine_winner
    w1 = @player1_weapon
    w2 = @player2_weapon
    if w1 == w2
      @winner = "TIE"
    elsif 
      (w1 == "ROCK" && w2 == "SCISSORS") || 
      (w1 == "SCISSORS" && w2 == "PAPER") || 
      (w1 == "PAPER" && w2 == "ROCK")
      @winner = @player1
    else
      @winner = @player2
    end
  end

def announce_winner
    if @winner == "TIE"
      drum_roll("\n\nDarn!  It's a TIE!", false)
      puts
    else
      puts
      drum_roll("And the winner is... #{@winner.upcase}", @winner == @player1 ? true : false)
      puts
    end
  end

  def increment_score
    if @winner == @player1
      @player1wins += 1
    elsif @winner == @player2
      @player2wins += 1
    elsif @winner == "TIE"
      @ties += 1
    end
  end

  def announce_score
    puts "\nThe score is #{@player1}: #{@player1wins}, #{@player2}: #{@player2wins}, TIES: #{@ties}"
  end

  def keep_playing?
    puts "Do you want to keep playing? (Y/N)"
    reply = gets.chomp[0].downcase
    reply == 'y' ? true : false
  end  

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

end #end of class RockPaperScissors


RockPaperScissors.new.run
