class Customer

attr_reader :name, :wallet, :age

def initialize(name, wallet, age)
  @name = name
  @wallet = wallet
  @age = age
  @consumption = []
  @drunkeness = 0
end

def are_you_18_or_over
  @age >= 18 ? true : false
end

def wallet_contents
  return @wallet
end

def how_many_drinks
  return @consumption.count
end


#########################################################

def complete_drinks_transaction(pub, drink)
  if are_you_18_or_over && @wallet >= drink.price && is_customer_able()
    pub.remove_drink_from_stock(drink)
    @consumption << drink
    pub.add_cash_to_till(drink)
    @wallet -= drink.price
  end
end

#########################################################

def orders_drink_from(pub, drink)
  pub.remove_drink_from_stock(drink)
  @consumption << drink
end

def pays_for_drink(pub, drink)
  pub.add_cash_to_till(drink)
  @wallet -= drink.price
end

#########################################################

def is_customer_able()
  drunk = 0
  for drink in @consumption
    drunk += drink.units
  end
  if drunk <= 20
    true
  else
    false
  end
end

#this is the end
end
