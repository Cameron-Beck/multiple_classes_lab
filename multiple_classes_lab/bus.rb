require_relative('bus_stop.rb')

class Bus

  attr_reader :route_no, :destination, :passengers

  def initialize(route_no, destination, passengers)
    @route_no = route_no
    @destination = destination
    @passengers = []
  end

  def drive()
    return "Brum! Brum!"
  end

  def number_of_passengers()
    return @passengers.length()
  end

  def pick_up(passenger1)
    @passengers.push(passenger1)
  end

  def drop_off(passenger)
    @passengers.delete(passenger)
  end

  def remove_all_passengers()
    @passengers.clear()
  end

  def can_pick_up_all_passangers(bus, bus_stop)
      pick_up(bus_stop)
      number_of_passengers()
  end

end
