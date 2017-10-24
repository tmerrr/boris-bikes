require_relative './bike.rb'
class DockingStation
  attr_reader :num_bikes

  def initialize
    @num_bikes = 6
  end

  def release_bike
    Bike.new
  end

  def return_bike
    @num_bikes += 1
  end
end
