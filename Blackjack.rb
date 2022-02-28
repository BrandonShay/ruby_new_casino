# require_relative 'Wallet.rb'
require_relative 'Math.rb'
# require_relative 'App.rb'
require_relative 'User.rb'

class Blackjack

  attr_accessor :user

  def initialize(user)
    @user = user
    blackjack_menu
  end

  def blackjack_menu
    puts "Welcome to Blackjack"
    puts "It's between you and the dealer"
    puts "Whomever gets closest to 21 wins"
    bj_game_menu
  end


  def bj_game_menu
    @dealer_total = 0
    @user_total = 0
    until (@user_total >= 21 || @dealer_total >= 21) do
      puts "Hit me? 'Y' or Fold 'N'"
      user_choice = gets.strip.downcase
        
        if user_choice == 'n'
          final_score
        end

      user_card = rand(1..10)
      dealer_card = rand(1..10)
      @user_total += user_card
      @dealer_total += dealer_card
      puts "You're card was #{user_card}"
      puts "You're now at #{@user_total}"
      puts "Your dealer is now at #{@dealer_total}"

        if @user_total > 21
          puts "You exceeded 21, You lose"
        elsif @dealer_total > 21
          puts "Dealer exceeded 21, You Win"
        end 
    end
  end

  def final_score
    puts "You're at #{@user_total}"
    puts "Dealer is at #{@dealer_total}"
    if @user_total > @dealer_total
      
      puts "You win"
    elsif @user_total < @dealer_total
      puts "Dealer wins"
    else @user_total == 0 && @dealer_total == 0
      puts "noone wins, try again"
      exit
    end
    blackjack_menu
  end

end

