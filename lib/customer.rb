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
      frequent_renter_points += rental.points
      total_amount += rental.price

      result += rental_string(rental)
    end

    result += "Amount owed is $#{total_amount}\n"
    result += "You earned #{frequent_renter_points} frequent renter points"
    result
  end
  
  def rental_string(rental)
    "\t#{rental.movie.title}\t#{rental.price}\n"
  end

end
