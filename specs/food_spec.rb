require("minitest/autorun")
require("minitest/rg")
require_relative("../food")

class FoodTest < MiniTest::Test

  def setup
    @banana = Food.new("Banana", 1)
  end

  def test_rejuvination_level
    assert_equal(1, @banana.rejuvination_level)
  end

end
