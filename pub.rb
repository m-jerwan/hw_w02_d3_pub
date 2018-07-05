require_relative("customer")
require_relative("drink")
require_relative("food")

class Pub

  attr_reader :name, :drink_stock, :till

  def initialize(name, drink_stock, food_stock)
    @name = name
    @till = 0
    @drink_stock = drink_stock
    @food_stock = food_stock
  end


  def count_drinks
    return @drink_stock.count
  end

  def count_food
    return @food_stock.count
  end

  def drinks_stock_value
    sum = 0
    for drink in @drink_stock
      sum += drink.price
    end
    return sum
  end
  # @drink_stock.sum{|}
  # return @drink_stock.sum {|drink| drink.price }
  # return @drink_stock.map {|drink| drink.price }.sum
  def food_stock_value
    sum = 0
    for food in @food_stock
      sum += food.price
    end
    return sum
  end

  def stock_value
    return drinks_stock_value + food_stock_value
  end

  def sell_drink(customer, drink)
    if
      customer.buy_drink(drink) != 0 && customer.alcohol_level < 20 && customer.age >= 18 && drink_stock.include?(drink)
      then
        @till += drink.price
        @drink_stock.delete(drink)
        customer.alcohol_level += drink.alcohol_units
  else
    return "Water maybe?"
  end
end

end
