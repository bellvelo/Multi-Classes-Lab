require('minitest/autorun')
require('minitest/rg')
require_relative('../drink')
require_relative('../pub')
require_relative('../customer')

class PubTest < Minitest::Test

def setup
  @drink1 = Drink.new("Beer", 1.0, 3)
  @drink2 = Drink.new("Wine", 2.0, 5)
  @drink3 = Drink.new("Whisky", 3.0, 10)
  stock = [@drink1, @drink2, @drink3]
  till = 1000.00
  @pub = Pub.new("Tipsy McSwaggers", till, stock)
end

def test_get_stock_count
  @pub.stock_count
  assert_equal(3, @pub.stock_count())
end

def test_add_drink_to_stock
  @dink4 = Drink.new("Lemoncelo", 0.5, 0)
  @pub.add_drink_to_stock(@drink4)
  assert_equal(4, @pub.stock_count)
end

def test_remove_drink_from_stock
  @pub.remove_drink_from_stock(@drink1)
  assert_equal(2, @pub.stock_count)
end

def test_get_till_contents
  @pub.whats_in_the_till
  assert_equal(1000.00, @pub.whats_in_the_till)
end

def test_add_cash_to_till
  @pub.remove_drink_from_stock(@drink1)
  @pub.add_cash_to_till(@drink1)
  assert_equal(1001.00, @pub.whats_in_the_till)
end






#this is the end
end
