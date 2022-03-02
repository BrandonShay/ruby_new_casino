# require_relative 'Wallet.rb'
# require_relative 'Math'

require_relative 'User.rb'

class Roulette
  attr_accessor :user
  

  def initialize(user)
    @user = user
    
    roulette_main_menu
  end

  # def initialize(money)
  #   @wallet = money
  # roulette_menu
  # end
  
  def roulette_main_menu
    puts "-- Welcome to Roullete --"
    r_game_menu
  end

  def r_game_menu
    puts "Place your bet. or 'exit' to Exit"
    user_bet = gets.strip.to_f
    if user_bet == 0
     puts "You have #{@user.current_bal} in your wallet."
      exit
    end
    
    if @user.validate_money(user_bet) != true
      puts "You don't have that much in your wallet."
      r_game_menu
    end

    puts "Pick a number between 0 - 36"
    user_guess = gets.strip.to_i
    result = rand(0..36)
  


    puts "The number is #{result}"
    if user_guess == result
      puts "You win"
      puts "You now have $#{@user.game_win(user_bet)} in your wallet"
      
    else 
      puts "You lose"
      puts "You now have $#{@user.game_lose(user_bet)} in your wallet"

    end
    
  end

  
end



