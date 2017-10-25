require 'docking_station.rb'

describe DockingStation do
    it { is_expected.to be_a(DockingStation) }

    it { is_expected.to respond_to(:release_bike) }

    it 'creates a bike' do
      expect(subject.release_bike).to be_instance_of(Bike)
    end

    it { is_expected.to respond_to(:return_bike) }

    it { is_expected.to respond_to(:num_bikes) }
    context 'when return_bike is called' do
      it 'adds 1 to num_bikes' do
        bikes_before = subject.num_bikes
        subject.return_bike
        expect(subject.num_bikes).to eq (bikes_before + 1)
      end
    end

    describe '#release_bike' do
      it 'raises an error when there are no bikes' do
        expect { subject.release_bike }.to raise_error 'No bikes available'
      end
    end

    it { expect(subject.any_bikes?).to eq subject.num_bikes > 0 ? true : false }

    # describe '#any_bikes?' do
    #   it 'returns NoMethodError before it\'s been created' do
    #     expect { subject.any_bikes }.to raise_error 'Method .any_bikes? not created'
    #   end
    # end

end
