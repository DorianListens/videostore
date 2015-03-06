class Customer
  attr_reader :name, :rentals

  def initialize(name)
    @name = name
    @rentals = []
  end

  def add_rental(rental)
    @rentals << rental
  end

  def statement
    RentalStatement.new(self).print_statement
  end

end

class RentalStatement
  def initialize(customer)
    @customer = customer
    @rentals = customer.rentals
  end

  def print_statement
    lines = []
    lines << header
    for rental in @rentals
      lines << rental_string(rental)
    end
    lines << amount_owed
    lines << total_points
    print_lines lines
  end

  def header
    "Rental record for #{@customer.name}\n"
  end

  def rental_string(rental)
    "\t#{rental.movie.title}\t#{rental.price}\n"
  end

  def print_lines(lines)
    result = ""
    lines.each do |line|
      result += line.to_s
    end
    result
  end

  def amount_owed
    "Amount owed is $#{total_amount}\n"
  end

  def total_points
    "You earned #{frequent_renter_points} frequent renter points"
  end
  
  def total_amount
    total = 0
    for rental in @rentals
      total += rental.price
    end
    total
  end
  
  def frequent_renter_points
    total = 0
    for rental in @rentals
      total += rental.points
    end
    total
  end


end
