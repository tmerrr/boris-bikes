require 'docking_station.rb'

describe DockingStation do
    it { is_expected.to be_a(DockingStation) }

    it { is_expected.to respond_to(:release_bike) }

    describe '#release_bike' do
      it 'releases a bike when available' do
        if subject.num_bikes > 0
          expect(subject.release_bike).to eq subject.bike
        end
      end
    end

    it { is_expected.to respond_to(:dock) }

    describe '#dock' do
      it 'does not exceed capacity of one' do
        if subject.num_bikes < 20
          bike = Bike.new
          expect { subject.dock(bike) }.to raise_error 'Station up to capacity'
        end
      end
    end

    it { is_expected.to respond_to(:num_bikes) }

    context 'when dock is called' do
      it 'adds 1 to num_bikes' do
        unless subject.any_bikes?
          bikes_before = subject.num_bikes
          bike = Bike.new
          subject.dock(bike)
          expect(subject.num_bikes).to eq (bikes_before + 1)
        end
      end
    end

    describe '#release_bike' do
      it 'raises an error when there are no bikes' do
        unless subject.any_bikes?
          expect { subject.release_bike }.to raise_error 'No bikes available'
        end
      end

      it 'reduces num_bikes by 1 when there are are bikes at station' do
        if subject.any_bikes?
          bikes_before = subject.num_bikes
          subject.release_bike
          expect(subject.num_bikes).to eq (bikes_before - 1)
        end
      end
    end


    it { expect(subject.any_bikes?).to eq subject.num_bikes > 0 ? true : false }

end
