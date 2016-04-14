# encoding: UTF-8
# Only works if that is first line in file

# Rock Paper Scissors
# Mary Dean
# 9/10/14

# Using ascii font Calvin S

intro = <<END_MARKER

╦  ┌─┐┌┬┐┌─┐  ╔═╗┬  ┌─┐┬ ┬
║  ├┤  │ └─┐  ╠═╝│  ├─┤└┬┘
╩═╝└─┘ ┴ └─┘  ╩  ┴─┘┴ ┴ ┴ 
    ╦═╗┌─┐┌─┐┬┌─              
    ╠╦╝│ ││  ├┴┐              
    ╩╚═└─┘└─┘┴ ┴              
        ╔═╗┌─┐┌─┐┌─┐┬─┐           
        ╠═╝├─┤├─┘├┤ ├┬┘           
        ╩  ┴ ┴┴  └─┘┴└─           
            ╔═╗┌─┐┬┌─┐┌─┐┌─┐┬─┐┌─┐    
            ╚═╗│  │└─┐└─┐│ │├┬┘└─┐    
            ╚═╝└─┘┴└─┘└─┘└─┘┴└─└─┘    

END_MARKER

fancy_rock = <<END_MARKER
    ╦═╗┌─┐┌─┐┬┌─              
    ╠╦╝│ ││  ├┴┐              
    ╩╚═└─┘└─┘┴ ┴              
END_MARKER

fancy_paper = <<END_MARKER
    ╔═╗┌─┐┌─┐┌─┐┬─┐           
    ╠═╝├─┤├─┘├┤ ├┬┘           
    ╩  ┴ ┴┴  └─┘┴└─           
END_MARKER

fancy_scissors = <<END_MARKER
    ╔═╗┌─┐┬┌─┐┌─┐┌─┐┬─┐┌─┐    
    ╚═╗│  │└─┐└─┐│ │├┬┘└─┐    
    ╚═╝└─┘┴└─┘└─┘└─┘┴└─└─┘    
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


# - - - - PROGRAM STARTS HERE - - - - -
continue = "yes"
score = {user: 0, computer: 0}

while continue == "yes" do #LOOP STARTS HERE

puts intro
puts "     \nPlease choose your implement of destruction:\n"
puts "     (R)ock, (P)aper, or (S)cissors... then press Enter\n\n"
choice = gets.chomp
puts "\n"
user_choice = case choice[0]
  when "r" || "R"
    "ROCK"
  when "p" || "P"
    "PAPER"
  when "s" || "S"
    "SCISSORS"
  else
    puts "Sorry, your only choice is Rock, Paper, or Scissors"
    exit
  end

computer_choice = ["ROCK", "PAPER", "SCISSORS"][rand(0..2)]

#GETTING VERY FRUSTRATED HERE TRYING TO MAKE A SINGLE
#DISPLAY FUNCTION BUT ONCE AGAIN I CAN'T SEEM TO DISPLAY
#STRINGS DEFINED AS LOCAL VARIABLES
puts "You chose:\n"
case user_choice
when "ROCK"
  puts fancy_rock
when "PAPER"
  puts fancy_paper
when "SCISSORS"
  puts fancy_scissors
end

puts "\nThe computer chose:\n"

case computer_choice
when "ROCK"
  puts fancy_rock
when "PAPER"
  puts fancy_paper
when "SCISSORS"
  puts fancy_scissors
end

puts "\n"
show_text = ". . . and the WINNER is . . . "
c = 0
show_text.length.times do
  print show_text[c]
    c += 1
  sleep 0.05
end
# audible bell
print "\a"
print "\n\n"

def determine_winner(u, c)
  if u == c
    return "TIE"
  elsif (u == "ROCK" && c == "SCISSORS") || (u == "SCISSORS" && c == "PAPER") || (u == "PAPER" && c == "ROCK")
    return "YOU"
  else
    return "COMPUTER"
  end
end

winner = determine_winner(user_choice, computer_choice)

if winner == "TIE"
  puts "\nOh, we're sorry, it appears to be a tie\n"
elsif winner == "COMPUTER"
  puts fancy_computer
  score[:computer] = score[:computer] + 1
else
  puts fancy_you
  score[:user] = score[:user] + 1
end

puts "\n\n"
puts "        SCORE:"
puts "    You: #{score[:user]}  Computer: #{score[:computer]}"
puts "\n\nWould you like to play again? (y/n)"
wants_to_continue = gets.chomp[0].downcase
if wants_to_continue != "y"
  puts "\nThank you for playing! Have a nice day"
end
continue  = wants_to_continue == "y" ? "yes" : "no"
end #end of while loop