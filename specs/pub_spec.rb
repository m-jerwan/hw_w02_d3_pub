require("minitest/autorun")
require("minitest/rg")
require_relative("../pub")

class PubTest < MiniTest::Test

  def setup
    @cosmo = Drink.new("Cosmopolitan", 10)
    @pint = Drink.new("Tennents", 5)
    @whiskey= Drink.new("Talisker", 15)

    @drink_stock = [@cosmo,@cosmo,@cosmo,@cosmo,@cosmo, @pint, @whiskey]

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
    assert_equal(7, actual)
  end

  def test_count_food
    actual = @hungryhorse.count_food
    assert_equal(3, actual)
  end

  def test_drinks_stock_value
    actual = @hungryhorse.drinks_stock_value
    assert_equal(70, actual)
  end

  def test_food_stock_value
    actual = @hungryhorse.food_stock_value
    assert_equal(7, actual)
  end

  def test_stock_value
    actual = @hungryhorse.stock_value
    assert_equal(77, actual)
  end

  def test_down_drink_alcohol_up__can_afford
    @hungryhorse.sell_drink(@marcin, @cosmo)
    actual_01 = @hungryhorse.count_drinks
    actual_02 = @marcin.alcohol_level
    assert_equal(2, actual_01)
    assert_equal(12, actual_02)
  end


  def test_sell_drink
    p @hungryhorse.till

    @hungryhorse.sell_drink(@marcin, @cosmo)
    p @hungryhorse.till
    @hungryhorse.sell_drink(@marcin, @cosmo)
    p @hungryhorse.till

    @hungryhorse.sell_drink(@marcin, @cosmo)
    p @hungryhorse.till

    @hungryhorse.sell_drink(@marcin, @cosmo)
    p @hungryhorse.till

    @hungryhorse.sell_drink(@marcin, @cosmo)
    p @hungryhorse.till

    @hungryhorse.sell_drink(@marcin, @cosmo)#no_sale
    assert_equal("Water maybe?", @hungryhorse.sell_drink(@marcin, @cosmo))
    assert_equal(20, @hungryhorse.drinks_stock_value)
    assert_equal(50, @hungryhorse.till)
    assert_equal(0, @hungryhorse.count_drinks)
  end

end
