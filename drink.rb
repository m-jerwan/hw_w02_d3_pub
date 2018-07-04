require_relative("pub")
require_relative("customer")
require_relative("food")

class Drink
  attr_reader :price

def initialize(name, price)
  @name = name
  @price = price
end

def alcohol_units
  return 2 if @name == "Cosmopolitan"
  return 1 if @name == "Bellhaven"
  return 3 if @name == "Old Fashioned"
end



end
