require 'Docking_station.rb'

describe DockingStation do
    it {is_expected.to be_a(DockingStation)}

    it { is_expected.to respond_to(:release_bike) }
    it 'create a bike' do
      expect(subject.release_bike).to be_instance_of(Bike)
    end

    it { is_expected.to respond_to(:return_bike) }

end
