require("minitest/autorun")
require("minitest/rg")
require_relative("../customer")

class CustomerTest < MiniTest::Test

  def setup
    @marcin = Customer.new("Marcin", 200, 36, 10)
    @cosmo = Drink.new("Cosmopolitan", 10)
  end

  def test_age
    assert_equal(36, @marcin.age)
  end

  def test_alcohol_level
    assert_equal(10, @marcin.alcohol_level)
  end

  def test_buy_drink
    @marcin.buy_drink(@cosmo)
    assert_equal(190, @marcin.wallet)
    # check drink DRINK price
    # check money in CUSTOMER wallet
    # take mone out wallet give to pub to buy drink
  end




end
