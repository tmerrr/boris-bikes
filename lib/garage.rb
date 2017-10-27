class Garage

  def initialize
    @fixed_bikes = []
    @broken_bikes = []
  end

  def receive(broken_bikes)
    @broken_bikes += broken_bikes
  end

  def fix(bike)
    bike.working = true
    @fixed_bikes.push(@broken_bikes.delete(bike))
  end

  def give
    bikes_to_give = @fixed_bikes
    @fixed.bikes.clear
    bikes_to_give
  end

end
