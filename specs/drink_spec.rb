require('minitest/autorun')
require('minitest/rg')
require_relative('../drink')

class DrinkTest < Minitest::Test

def setup
  @drink = Drink.new("Beer", 1.0, 3)
end

def test_get_drink_name
  @drink.name
  assert_equal("Beer", @drink.name())
end

def test_get_drink_price
  @drink.price
  assert_equal(1.0, @drink.price())
end












#this is the end
end
