# require_relative 'Wallet.rb'
# require_relative 'Math.rb'
require_relative 'User.rb'

class Blackjack

  attr_accessor :user

  def initialize(user)
    @user = user
    blackjack_main_menu
  end


  def blackjack_main_menu
    puts "-- Welcome to Blackjack --"
    puts "It's between you and the dealer"
    puts "Whomever gets closest to 21 wins"
    bj_game_menu
  end


  def bj_game_menu

    puts "Place your bet. or 'exit' to Exit"
    @user_bet = gets.strip.to_f
    if @user_bet == 0
      exit
    end
    if @user.validate_money(@user_bet) != true
      puts "You don't have that much in your wallet."
      bj_game_menu
    end
    game_loop
  end


  def game_loop

    @dealer_total = 0
    @player_total = 0

    while (@player_total <= 21 || @dealer_total <= 21) do

      puts "Hit Me 'Y' - Hold 'N' - Fold 'F'"
      user_choice = gets.strip.downcase
      choices = ['y','n', 'f']
        until choices.include?(user_choice)
          puts "Try again"
          user_choice = gets.strip.downcase
        end
        
        if user_choice == 'f' 
          final_score(@player_total, @dealer_total)
          break
        end
  
        if user_choice =='n' && @dealer_total <= 17 
          dealer_card = rand(1..10)
          @dealer_total += dealer_card
          puts "Dealer card: #{dealer_card} Dealer total: #{@dealer_total}"
          if @dealer_total > 21
            over_21(@player_total, @dealer_total)
            break
          else  
            final_score(@player_total, @dealer_total)
          break
          end
        elsif user_choice =='n' && @dealer_total >= 18
          puts "Dealer Held"
          final_score(@player_total, @dealer_total)
          break
        end
  
        if @dealer_total >= 18 && user_choice == 'y' 
          player_card = rand(1..10)
          @player_total += player_card
          puts "You're card was: #{player_card}, You're total #{@player_total}"
          puts "Dealer Held, Dealer total #{@dealer_total}"
          if @player_total > 21 && @dealer_total <=21
            puts "* You exceeded 21 *"
            puts "Dealer wins: #{dealer}"
            @user.game_lose(@user_bet)
            puts "You now have $#{@user.current_bal} in your wallet"
          else
          final_score(@player_total, @dealer_total)
          break
          end
        end



      player_card = rand(1..10)
      dealer_card = rand(1..10)
      @player_total += player_card
      @dealer_total += dealer_card
      puts "You're card was #{player_card}"
      puts "You're now at #{@player_total}"
      puts "Your dealer is now at #{@dealer_total}"

        if @player_total == 21
          puts "You hit 21!"
          final_score(@player_total, @dealer_total)
          break
        elsif @dealer_total == 21
          puts "Dealer hit 21!"
          final_score(@player_total, @dealer_total)
          break
        end


        if @player_total > 21
          puts "* You exceeded 21 *" 
          over_21(@player_total, @dealer_total)
          break
        elsif @dealer_total > 21
          puts "* Dealer exceeded 21 *"
          over_21(@player_total, @dealer_total)
          break
        end 

    end   
 
  end


  def over_21(player, dealer)
    if player > 21 && dealer > 21
      puts "player: #{@player_total} -- dealer: #{@dealer_total}"
      puts "Noone wins, Try again"
    elsif player <= 21 && dealer > 21
      puts "You win: #{player}"
      @user.game_win(@user_bet)
      puts "You now have $#{@user.current_bal} in your wallet"
    elsif dealer <= 21 && player > 21
      puts "Dealer wins: #{dealer}"
      @user.game_lose(@user_bet)
      puts "You now have $#{@user.current_bal} in your wallet"
    end

  end

  def final_score(player, dealer)

    if player > dealer && player <= 21
      puts "You win: #{player}"
      @user.game_win(@user_bet)
      puts "You now have $#{@user.current_bal} in your wallet"
    elsif dealer > player && dealer <= 21
      # puts "Dealer card : #{@dealer_card}"
      puts "Dealer wins: #{dealer}"
      @user.game_lose(@user_bet)
      puts "You now have $#{@user.current_bal} in your wallet"
    elsif player === dealer
      puts "It's a TIE! No one wins, Try again"
    end
  
  end

end


