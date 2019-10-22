require('minitest/autorun')
require('minitest/rg')
require_relative('../bus.rb')
require_relative('../person.rb')
require_relative('../bus_stop.rb')

class BusRouteTest < MiniTest::Test
  def setup
    @bus = Bus.new(22, "Ocean Terminal", [])

    @passenger1 = Person.new("Slyvester Stallone", 73)
    @passenger2 = Person.new("Bruce Willis", 64)
    @passenger3 = Person.new('Jason Statham', 52 )

    @bus_stop = BusStop.new("Haymarket", [])

  end

  def test_drive()
    assert_equal("Brum! Brum!", @bus.drive())
  end

  def test_number_of_passengers()
    assert_equal(0, @bus.number_of_passengers)
  end

  def test_pick_up()
    @bus.pick_up(@passenger1)
    assert_equal(1, @bus.number_of_passengers)
  end

  def test_drop_off
    @bus.drop_off(@passenger1)
    assert_equal(0, @bus.number_of_passengers)
  end

  def test_remove_all_passengers
    @bus.remove_all_passengers
    assert_equal(0, @bus.number_of_passengers)
  end

  def test_add_person_to_que
    @bus_stop.add_person_to_que(@passenger3)
    @bus_stop.add_person_to_que(@passenger1)
    assert_equal(2,@bus_stop.count_number_in_que)
  end

  def test_can_pick_up_all_passangers
    @bus.can_pick_up_all_passangers(@bus.passengers, @bus_stop.que)
    @bus_stop.add_person_to_que(@passenger3)
    @bus_stop.add_person_to_que(@passenger1)
    assert_equal(2, @bus.number_of_passengers)
    assert_equal(0, @bus_stop.count_number_in_que)
  end
end
