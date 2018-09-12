require('minitest/autorun')
require('minitest/rg')
require_relative('../drink')
require_relative('../pub')
require_relative('../customer')

class CustomerTest < Minitest::Test

def setup
  wallet = 50.0
  @customer = Customer.new("Bob", wallet, 21)
  drink = Drink.new("Beer", 1.0, 3)
  @drink1 = Drink.new("Beer", 1.0, 3)
  @drink2 = Drink.new("Wine", 2.0, 5)
  @drink3 = Drink.new("Whisky", 3.0, 10)
  stock = [@drink1, @drink2, @drink3]
  till = 1000.0
  @pub = Pub.new("Tipsy McSwaggers", till, stock)
  @consumption = []
end

def test_are_you_18_or_over
  @customer.are_you_18_or_over
  assert_equal(true, @customer.are_you_18_or_over)
end

def test_wallet_contents
  @customer.wallet_contents
  assert_equal(50, @customer.wallet_contents)
end

def test_how_many_drinks
  @customer.how_many_drinks
  assert_equal(0, @customer.how_many_drinks)
end

#########################################################

def test_complete_drinks_transaction
  @customer.complete_drinks_transaction(@pub, @drink1)
  @customer.complete_drinks_transaction(@pub, @drink2)
  assert_equal(1, @pub.stock_count)
  assert_equal(2, @customer.how_many_drinks)
  assert_equal(1003.0, @pub.whats_in_the_till)
  assert_equal(47.0, @customer.wallet_contents)
  @consumption = []
end

#########################################################

def test_buys_drink()
  @customer.orders_drink_from(@pub, @drink1)
  assert_equal(2, @pub.stock_count)
  assert_equal(1, @customer.how_many_drinks)
end

def test_pay_for_drink()
  @customer.pays_for_drink(@pub, @drink2)
  assert_equal(1002.0, @pub.whats_in_the_till)
  assert_equal(48.0, @customer.wallet_contents)
end

#########################################################

def test_is_customer_able
  @customer.orders_drink_from(@pub, @drink3)
  @customer.orders_drink_from(@pub, @drink2)
  @customer.orders_drink_from(@pub, @drink1)
  @customer.is_customer_able()
  assert_equal(true, @customer.is_customer_able)
end

#this is the end
end
