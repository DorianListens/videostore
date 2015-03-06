class Movie
  attr_reader :title

  def initialize(title)
    @title = title
  end

  def price_for(days_rented)
  end

  def points_for(days_rented)
    points = 1
  end
end

class RegularMovie < Movie
  def price_for(days_rented)
    price = 2
    if days_rented > 2
      price += (days_rented - 2) * 1.5
    end
    price
  end
end

class ChildrensMovie < Movie
  def price_for(days_rented)
    price = 1.5
    if days_rented > 3
      price += (days_rented - 3) * 1.5
    end
    price
  end
end

class NewReleaseMovie < Movie
  def price_for(days_rented)
    price = days_rented * 3
  end

  def points_for(days_rented)
    points = 1
    if days_rented > 1
      points += 1
    end
    points
  end
end

class AwesomeMovie < Movie
  def price_for(days_rented)
    price = days_rented * 9
  end

  def points_for(days_rented)
    points = 2
    if days_rented > 3
      points += 5
    end
    points
  end
end
