require_relative './bike.rb'
class DockingStation
  attr_reader :num_bikes

  def initialize
    @num_bikes = 0
  end

  def release_bike
    fail 'No bikes available' unless any_bikes?
    Bike.new
  end

  def return_bike
    @num_bikes += 1
  end

  def any_bikes?
    @num_bikes > 0
  end
end
