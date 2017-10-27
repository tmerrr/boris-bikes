require_relative './bike.rb'

class DockingStation
  attr_reader :bikes, :capacity
  DEFAULT_CAPACITY = 20

  public
  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  def release_bike
    fail 'No bikes available' if empty?
    fail "sorry all bikes broken" if num_working_bikes <= 0
    get_working_bike
  end

  def dock(bike)
    fail 'Station up to capacity' if full?
    @bikes << bike
    'Bike reported as broken' unless bike.working?
  end

  def num_bikes
    @bikes.length
  end

  def num_working_bikes
    @bikes.count { |bike| bike.working? }
  end

  private
  def full?
    @bikes.length >= @capacity
  end

  def empty?
    @bikes.empty?
  end

  def get_working_bike
    @bikes.each { |bike| return @bikes.delete(bike) if bike.working? }
  end

end
