require_relative './bike.rb'

class DockingStation
  attr_reader :num_bikes, :bike

  def initialize
    @current_bikes = []
    20.times { @current_bikes << Bike.new }
    @num_bikes = @current_bikes.length
  end

  def release_bike
    fail 'No bikes available' unless any_bikes?
    @num_bikes -= 1
    @bike = @current_bikes.pop
  end

  def dock(bike)
    fail 'Station up to capacity' if @num_bikes >= 20
    @num_bikes += 1
    @current_bikes << bike
  end

  def any_bikes?
    @num_bikes > 0
  end
end
