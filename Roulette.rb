require_relative 'Wallet'
# require_relative 'Math'
# require_relative 'App'
require_relative 'User'

class Roulette
  attr_accessor :user
  

  def initialize(user)
    @user = user
    
    roulette_menu
  end

  # def initialize(money)
  #   @wallet = money
  # roulette_menu
  # end
  


  def roulette_menu
    puts "Place your bet"
    user_bet = gets.to_f
    
    @wallet = Wallet.new(user_bet)
    

  
    
    # if money <= user_bet
    #   puts "You don't have that much money"
    #   roulette_menu
    # else
      puts "Pick a number between 0 - 36"
      user_guess = gets.strip.to_i
      result = rand(0..36)
  


    puts "The number is #{result}"
    if user_guess == result
      puts "You win"
      @wallet.game_win(user_bet)
  
    else 
      puts "You lose"
      @wallet.game_lose(user_bet)

      
    end
  App.new.game_menu
  end
  
end



