require_relative 'bike'
require_relative 'van'

class DockingStation
  
  DEFAULT_CAPACITY = 20

  attr_reader :bikes, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    fail 'no bikes available' if empty?
    raise 'bike is broken' if broken?
    bikes.pop
  end

  def dock(bike)
    fail 'station at capacity' if full?
    bikes << bike
  end

  private
  
   
  def full?
    bikes.count >= capacity
  end
  
  def empty?
    bikes.empty?
  end
  
  def broken?
    if bikes.last.working? == false
      true
    else
      false
    end
  end
end
