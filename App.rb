require_relative 'Wallet.rb'
require_relative 'User.rb'
require_relative 'Blackjack.rb'
require_relative 'Roulette.rb'

class App
  attr_accessor :user

  def initialize
    welcome_menu
    @user_create = create_user
  end

  def welcome_menu
    puts "Welcome to the Casino"
  end

  def create_user
    puts "What is your first name?"
    f_name = gets.strip
    puts "How much money would you like to use?"
    money = gets.strip.to_f

    @wallet = Wallet.new(money)
    if @wallet.validate_money(money)
      puts "Your Balance is now #{@wallet.current_bal}"
    @user = User.new(f_name)
    end
    game_menu
  end

  def game_menu
    puts "What game would you like to play?"
    puts "1) Black Jack"
    puts "2) Roulette"
    puts "3) View Wallet"
    puts "4) Exit"
    menu_choice = gets.strip.to_i
    if menu_choice == 1
      Blackjack.new(@user)
      game_menu
    elsif menu_choice == 2
      Roulette.new(@user)
      
    elsif menu_choice == 3
        puts "#{@wallet.current_bal}"
        game_menu
    elsif menu_choice == 4
      "See you next time"
      exit
    else
      "Wrong choice, try again"
      game_menu 
    end
  end

end

app = App.new