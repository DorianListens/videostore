class Customer
  attr_reader :name

  def initialize(name)
    @name = name
    @rentals = []
  end

  def add_rental(rental)
    @rentals << rental
  end

  def statement
    total_amount = 0
    frequent_renter_points = 0
    result = "Rental record for #{@name}\n"
    for rental in @rentals
      this_amount = rental.price
      frequent_renter_points += rental.points

      result += "\t#{rental.movie.title}\t#{this_amount}\n"
      total_amount += this_amount
    end

    result += "Amount owed is $#{total_amount}\n"
    result += "You earned #{frequent_renter_points} frequent renter points"
    result
  end
end
