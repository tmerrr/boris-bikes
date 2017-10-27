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
    # bike.break_bike if broken_bike?
    @bikes << bike
    'Bike reported as broken' unless bike.working?
  end

  def num_bikes
    @bikes.length
  end

  def num_working_bikes
    working_bikes = 0
    @bikes.each { |bike| working_bikes += 1 if bike.working? }
    working_bikes
  end

  private
  def full?
    @bikes.length >= @capacity
  end

  def empty?
    @bikes.empty?
  end

  def broken_bike?
    number = rand(101)
    number <= 70
  end

  def get_working_bike
    @bikes.each do |bike|
      if bike.working?
        bike_index = @bikes.index(bike)
        working_bike = @bikes.delete_at(bike_index)
      end
      return working_bike
    end
  end

end
