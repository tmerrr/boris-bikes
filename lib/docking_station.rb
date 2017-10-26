require_relative './bike.rb'

class DockingStation
  attr_reader :bike, :current_bikes, :capacity

  public
  def initialize(capacity=20)
    @capacity = capacity
    @current_bikes = []
  end

  def release_bike
    fail 'No bikes available' if empty?
    fail "sorry all bikes broken" if num_working_bikes <= 0
    get_working_bike
  end

  def dock(bike)
    fail 'Station up to capacity' if full?
    bike.working = broken_bike?
    @current_bikes << bike
    'Bike reported as broken' unless bike.working
  end

  def num_bikes
    @current_bikes.length
  end

  def num_working_bikes
    working_bikes = 0
    @current_bikes.each { |bike| working_bikes += 1 if bike.working }
    working_bikes
  end

  private
  def full?
    @current_bikes.length >= @capacity
  end

  def empty?
    @current_bikes.empty?
  end

  def broken_bike?
    number = rand(101)
    number <= 70
  end

  def get_working_bike
    @current_bikes.each do |bike|
      if bike.working
        bike_index = @current_bikes.index(bike)
        working_bike = @current_bikes.delete_at(bike_index)
      end
    return working_bike
    end
  end

end
