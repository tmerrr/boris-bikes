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
    broken_bikes = 0
    @current_bikes.each do |bike|
      broken_bikes += 1 unless bike.working
    end

    if broken_bikes == num_bikes
      "sorry all bikes broken"
    else
      @current_bikes.pop
    end
  end

  def dock(bike)
    fail 'Station up to capacity' if full?
    # bike.working = broken_bike?
    @current_bikes << bike
    'Bike reported as broken' unless bike.working
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

  def broken_bike?
    number = rand(101)
    number <= 80
  end

end
