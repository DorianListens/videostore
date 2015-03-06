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
    price = 0
    if @price_code == Movie::REGULAR
      price += 2
      if days_rented > 2
        price += (days_rented - 2) * 1.5
      end
    elsif @price_code == Movie::NEW_RELEASE
      price  += days_rented * 3
    elsif @price_code == Movie::CHILDRENS
      price += 1.5
      if days_rented > 3
        price += (days_rented - 3) * 1.5
      end
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
