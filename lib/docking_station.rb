require_relative './bike.rb'

class DockingStation
  attr_reader :bike, :current_bikes, :capacity

  public
  def initialize(capacity=20)
    @capacity = capacity
    @current_bikes = []
    @capacity.times { @current_bikes << Bike.new }
  end

  def release_bike
    fail 'No bikes available' if empty?
    @bike = @current_bikes.pop
  end

  def dock(bike)
    fail 'Station up to capacity' if full?
    @current_bikes << bike
  end

  def num_bikes
    @current_bikes.length
  end

  private
  def full?
    @current_bikes.length >= @capacity
  end

  def empty?
    @current_bikes.empty?
  end

end
