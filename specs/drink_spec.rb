require("minitest/autorun")
require("minitest/rg")
require_relative("../drink")

class DrinkTest < MiniTest::Test

def setup
  @cosmo = Drink.new("Cosmopolitan", 10)
end

def test_alcohol_units
  assert_equal(2, @cosmo.alcohol_units)
end






end
