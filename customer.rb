require_relative("pub")
require_relative("drink")
require_relative("food")

class Customer

attr_reader :name, :age, :wallet
attr_accessor :alcohol_level

  def initialize(name, wallet, age, alcohol_level)
    @name = name
    @wallet = wallet
    @age = age
    @alcohol_level = alcohol_level
  end

  def buy_drink(drink)
    if @wallet < drink.price
      return 0
    else
      @wallet = @wallet - drink.price
      return drink.price
    end
  end
end
