class Pub

attr_reader :name, :till, :stock

  def initialize(name, till, stock)
    @name = name
    @till = till
    @stock = stock
  end

  def stock_count
    return @stock.count
  end

  def add_drink_to_stock(drink)
    @stock << drink
  end

  def remove_drink_from_stock(drink)
    @stock.delete(drink)
  end

  def whats_in_the_till
    return @till
  end

  def add_cash_to_till(drink)
    return @till += drink.price
  end



#this is the end
end
