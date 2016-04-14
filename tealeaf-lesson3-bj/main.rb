require 'rubygems'
require 'sinatra'
require 'pry'


#removed this line due to possible conflict with chrome
#set :sessions, true
#and added this line. This must be reason for SECURITY WARNING:
#No secret option provided...message
use Rack::Session::Cookie, :key => 'rack.session',
                            :path => '/',
                            :secret => 'some_random_string'

#these lines are for me to test over home network
set :environment, :production
#set :bind, '192.168.1.106'

helpers do

    def value_of_hand(array_of_cards)
      faces = {"ace" =>11,
               "2" => 2,
               "3" => 3,
               "4" => 4,
               "5" => 5,
               "6" => 6,
               "7" => 7,
               "8" => 8,
               "9" => 9,
               "10" => 10,
               "jack" => 10,
               "queen" => 10,
               "king" => 10
      }
      total_value = 0
      num_aces = 0
      array_of_cards.each do |c|
        #cards are in string format, e.g. "jack_of_diamonds"
        face = c.split('_',0)[0]

        value = faces[face]

        total_value += value

        num_aces += 1 if face == 'ace'

      end
      #correct for Aces -- BORROWED THIS LOGIC FROM TEACHER'S CODE
      num_aces.times do
        total_value -= 10 if total_value > 21
      end

      return total_value
    end #end value_of_hand

    def decrease_kitty_by(amount)
      old_kitty = session[:kitty].to_i
      new_kitty = old_kitty - amount
      session[:kitty] = new_kitty.to_s
      if new_kitty <= 0
        @error = "You have run out of money, please put more money in your kitty"
      end
    end

    def increase_kitty_by(amount)
      old_kitty = session[:kitty].to_i
      new_kitty = old_kitty + amount
      session[:kitty] = new_kitty.to_s
    end

    def check_kitty
      kitty = session[:kitty].to_i
      bet = session[:current_bet].to_i
      if kitty < bet
        redirect "/game/overdraft"
      end
    end


  def set_helpful_message(type)
    #after extracting all these I think it was a mistake because now the
    #lookups will be done even if they aren't needed
    player_value = value_of_hand(session[:player_cards]).to_s
    dealer_value = value_of_hand(session[:dealer_cards]).to_s
    bet_value = session[:current_bet]
    name_value = session[:player_name]
    message =
      case type
        when 'continue_player_hand'
          "<h3>Your cards add up to:<strong> #{player_value} </strong></h3>What would you like to do?"
        when 'player_went_over'
          "<h3>Drat!</h3>Too bad! With #{player_value} you have busted, #{name_value}. I hope you will play again"
        when 'player_stays'
          "<h3>Player stays</h3>You have chosen to stay with #{player_value}. Now it's the dealer's turn."
        when 'dealer_must_hit'
          "The dealer must hit..."
        when 'dealer_went_over'
          "<h3>Yahoo!</h3> The dealer went over! You win #{bet_value} chips!"
        when 'player_blackjack'
          "<h3>Awesome! #{name_value} got a BLACKJACK!</h3> You win #{(session[:current_bet].to_i * 2).to_s} chips!"
        when 'dealer_blackjack'
          "<h3>Dealer Blackjack :-( </h3>Too bad, #{name_value}, the dealer got a blackjack. You lose #{bet_value} chips"
        when 'dealer_wins'
          "<h3>Darn!</h3> The dealer's #{dealer_value} beats your #{player_value}. You lose #{bet_value} chips"
        when 'player_wins'
          "<h3>You win!</h3> Congratulations, #{name_value}, you won #{bet_value} chips!"
        when 'its_a_tie'
          "<h3>Tie game</h3>You both have #{dealer_value}, so looks like we have a TIE! Let's play again."
      end #end of case
    session[:helpful_message]=message
    message
  end #of def

end #of helpers


# WELCOME
# I wanted to serve a static page but couldn't figure out how
get '/' do
  erb :index, :layout => :layout_plain
end

# GET and SUBMIT USER NAME
get '/set_name' do
  erb :set_name, :layout => :layout_plain
end


# SET NAME, KITTY, AND INITIAL BET
post '/set_name' do
  session[:player_name] = params[:player_name]
  session[:kitty] = params[:kitty]
  session[:current_bet] = params[:current_bet]

  check_kitty
  redirect "/game"
end

#CREATE DECK OF CARDS AND DEAL 2 CARDS TO EACH
#ALSO SET SHOW/HIDE VARIABLES
get '/game' do
  @show_dealer_first_card = false
  @show_hit_stay_buttons = true
  @show_dealer_turn_button = false
  @dealer_blackjack = false
  @player_blackjack = false
  session[:dealer_cards] = []
  session[:player_cards] = []
  # I WANT TO RE-USE DECK FOR CARD COUNTING SO ONLY CREATE NEW DECK IF NEEDED
  if session[:deck].nil? || session[:deck].size < 10
   suits = ["hearts", "clubs", "spades", "diamonds"]
      faces = ["ace", "2", "3", "4", "5", "6", "7", "8", "9", "10","jack","queen","king"]
      deck = []
      cards= faces.each do |s|
        suits.each do |f|
          card = "#{s}_of_#{f}"
          deck.push(card)
        end
      end
   deck.shuffle!
   session[:deck] = deck
   end
  session[:player_cards] = [session[:deck].pop, session[:deck].pop]
  session[:dealer_cards] = [session[:deck].pop, session[:deck].pop]
  if value_of_hand(session[:player_cards])== 21
    @player_blackjack = true
    @show_hit_stay_buttons = false
    @show_play_again_button = true
    increase_kitty_by(session[:current_bet].to_i * 2)
    set_helpful_message('player_blackjack')
    else
    set_helpful_message('continue_player_hand')
    end
  erb :game
end

post '/game/player/hit' do
  session[:player_cards] << session[:deck].pop
  if value_of_hand(session[:player_cards])>21
    set_helpful_message('player_went_over')
    decrease_kitty_by(session[:current_bet].to_i)
    @show_hit_stay_buttons = false
    @show_dealer_turn_button = false
    @show_play_again_button = true
    @show_dealer_first_card = false
    erb :game
  else
    @show_hit_stay_buttons = true
    @show_dealer_turn_button = false
    @show_play_again_button = false
    @show_dealer_first_card = false
    set_helpful_message('continue_player_hand')
  end
  erb :game
end

post '/game/player/stay' do
  set_helpful_message('player_stays')
  #@success = "You have chosen to stay with #{value_of_hand(session[:player_cards])}"
  @show_hit_stay_buttons = false
  @show_dealer_turn_button = true
  @show_dealer_first_card = false
  erb :game
end

get '/game/dealer' do
  @show_hit_stay_buttons = false
  dealer_value = value_of_hand(session[:dealer_cards])
  player_value = value_of_hand(session[:player_cards])
  if dealer_value == 21 && session[:dealer_cards].size == 2
    set_helpful_message('dealer_blackjack')
    decrease_kitty_by(session[:current_bet].to_i)
    @show_play_again_button = true
  elsif dealer_value > 21
    set_helpful_message('dealer_went_over')
    @show_play_again_button = true
    increase_kitty_by(session[:current_bet].to_i)
  elsif dealer_value < 17
    set_helpful_message('dealer_must_hit')
    redirect '/game/dealer/hit'
  elsif dealer_value >= 17
    if dealer_value > player_value
      set_helpful_message('dealer_wins')
      @show_play_again_button = true
      decrease_kitty_by(session[:current_bet].to_i)
    elsif dealer_value < player_value
      set_helpful_message('player_wins')
      increase_kitty_by(session[:current_bet].to_i)
      @show_play_again_button = true
    elsif dealer_value == player_value
      set_helpful_message('its_a_tie')
      @show_play_again_button = true
    end
  end
  @show_dealer_first_card = true
  erb :game
end

get '/game/dealer/hit' do
  session[:dealer_cards] << session[:deck].pop
  redirect '/game/dealer'
end

get '/game/overdraft' do
  erb :overdraft
end

get '/game/player/set_new_bet' do
  erb :new_bet
end



post '/game/player/set_new_bet' do
  current_kitty = session[:kitty].to_i
  new_amount = params[:add_to_kitty].to_i
  total = current_kitty + new_amount
  session[:kitty] = total.to_s
  session[:current_bet] = params[:current_bet]
  check_kitty
  redirect '/game'
end


get '/profile' do
  "Edit your profile here"
end

get '/cash_out' do
  "Here are your big winnings!"
end

