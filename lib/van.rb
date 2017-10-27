require 'garage.rb'

class Van

  def initialize
    @fixed_bikes = []
    @broken_bikes = []
  end

  def deliver(place)
    bikes_to_give = @fixed_bikes
    @fixed.bikes.clear
    place.receive(bikes_to_give)
  end
  
  def pick_up(place)
    @fixed_bikes += place.give
  end

end
