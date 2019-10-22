

class BusStop


  attr_reader :name, :que

def initialize(name, que)
  @name = name
  @que = []
end

def add_person_to_que(passenger)
  @que.push(passenger)
end

def count_number_in_que
  @que.count
end


end
