class Movie
  REGULAR = 0
  NEW_RELEASE = 1
  CHILDRENS = 2

  attr_reader :title
  attr_accessor :price_code

  def initialize(title, price_code)
    @title = title
    @price_code = price_code
  end

  def price_for(days_rented)
    if @price_code == Movie::REGULAR
      price = PricePolicy.for(days_rented)
    elsif @price_code == Movie::NEW_RELEASE
      price = PricePolicy.for_new_release(days_rented)
    elsif @price_code == Movie::CHILDRENS
      price = PricePolicy.for_childrens(days_rented)
    end
    price
  end

  def points_for(days_rented)
    points = 1
    if @price_code == Movie::NEW_RELEASE && days_rented > 1
      points += 1
    end
    points
  end
end

class PricePolicy
  def self.for(days_rented)
    price = 2
    if days_rented > 2
      price += (days_rented - 2) * 1.5
    end
    price
  end
  def self.for_new_release(days_rented)
    price  = days_rented * 3
  end
  
  def self.for_childrens(days_rented)
    price = 1.5
    if days_rented > 3
      price += (days_rented - 3) * 1.5
    end
    price
  end
end

