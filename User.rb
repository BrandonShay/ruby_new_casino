# require_relative 'Wallet.rb'


class User 
  attr_accessor :first_name, :money

  def initialize(first_name, money)
    @first_name = first_name
    @wallet = money
  end
 

  def current_bal
    @wallet
  end

  def validate_money(money)
    if money > 0 && (@wallet - money) >= 0
      true
    else
      false
    end
  end
    

  def game_lose(money)
    @wallet -= money
  end

  def game_win(money)
    @wallet += money
  end

end