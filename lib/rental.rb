class Rental
  attr_reader :movie, :days_rented

  def initialize(movie, days_rented)
    @movie = movie
    @days_rented = days_rented
  end

  def price
    @movie.price_for(@days_rented)
  end

  def points
    @movie.points_for(@days_rented)
  end
end
