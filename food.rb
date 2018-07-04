require_relative("pub")
require_relative("drink")
require_relative("customer")

class Food
  attr_reader :price

def initialize(type, price)
  @type = type
  @price = price
end

def rejuvination_level
  return 10 if @type == "Deep fried mars bar"
  return 5 if @type == "Crisps"
  return 1 if @type == "Banana"
end


end
