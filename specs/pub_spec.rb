require("minitest/autorun")
require("minitest/rg")
require_relative("../pub")

class PubTest < MiniTest::Test

  def setup
    @cosmo_01 = Drink.new("Cosmopolitan", 10)
    @cosmo_02 = Drink.new("Cosmopolitan", 10)
    @cosmo_03 = Drink.new("Cosmopolitan", 10)
    @cosmo_04 = Drink.new("Cosmopolitan", 10)
    @cosmo_05 = Drink.new("Cosmopolitan", 10)
    @cosmo_06 = Drink.new("Cosmopolitan", 10)
    @cosmo_07 = Drink.new("Cosmopolitan", 10)
    @pint = Drink.new("Tennents", 5)
    @whiskey= Drink.new("Talisker", 15)

    @drink_stock = [@cosmo_01, @cosmo_02, @cosmo_03, @cosmo_04, @cosmo_05, @cosmo_06, @cosmo_07, @pint, @whiskey]

    @banana = Food.new("Banana", 1)
    @mars = Food.new("Deep fried mars bar", 4)
    @walkers = Food.new("crisps", 2)

    @food_stock = [@banana, @mars, @walkers]

    @marcin = Customer.new("Marcin", 200, 36, 10)

    @hungryhorse = Pub.new("Hungry Horse", @drink_stock, @food_stock)

  end

  def test_pub_name
    assert_equal("Hungry Horse", @hungryhorse.name)
  end

  def test_count_drinks
    actual = @hungryhorse.count_drinks
    assert_equal(9, actual)
  end

  def test_count_food
    actual = @hungryhorse.count_food
    assert_equal(3, actual)
  end

  def test_drinks_stock_value
    actual = @hungryhorse.drinks_stock_value
    assert_equal(90, actual)
  end

  def test_food_stock_value
    actual = @hungryhorse.food_stock_value
    assert_equal(7, actual)
  end

  def test_stock_value
    actual = @hungryhorse.stock_value
    assert_equal(97, actual)
  end

  def test_down_drink_alcohol_up__can_afford
    @hungryhorse.sell_drink(@marcin, @cosmo_01)
    actual_01 = @hungryhorse.count_drinks
    actual_02 = @marcin.alcohol_level
    assert_equal(8, actual_01)
    assert_equal(12, actual_02)
  end


  def test_sell_drink
    @hungryhorse.sell_drink(@marcin, @cosmo_01)
    @hungryhorse.sell_drink(@marcin, @cosmo_02)
    @hungryhorse.sell_drink(@marcin, @cosmo_03)
    @hungryhorse.sell_drink(@marcin, @cosmo_04)
    @hungryhorse.sell_drink(@marcin, @cosmo_05)
    # now no_sale, too drunk(@marcin.alcohol_level raching limit)
    @hungryhorse.sell_drink(@marcin, @cosmo_06)
    assert_equal("Water maybe?", @hungryhorse.sell_drink(@marcin, @cosmo_07))
    assert_equal(40, @hungryhorse.drinks_stock_value) #checking value of drinks left
   assert_equal(50, @hungryhorse.till) #checking money in till after sales
    assert_equal(4, @hungryhorse.count_drinks) # drinks count after sales
  end

end
