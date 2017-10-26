require 'docking_station.rb'

describe DockingStation do
    describe '#dock' do
      it 'does not exceed capacity' do
        if subject.num_bikes <= subject.capacity
          bike = Bike.new
          expect { subject.dock(bike) }.to raise_error 'Station up to capacity'
        end
      end
    end

    describe '#release_bike' do
      context 'when bike is broken, but working bikes are available' do
        it 'returns the next available bike' do
          bike = subject.current_bikes.last
          bike.working = false
          expect(subject.release_bike).not_to eq bike
          expect(subject.release_bike).to be_a(Bike)
        end
      end
    end

    it { expect(DockingStation.new(25).capacity).to eq 25 }
    it { expect(DockingStation.new().capacity).to eq 20 }

    context 'when docking a bike' do
      it 'adds 1 to num_bikes if not full' do
        if subject.num_bikes < subject.capacity
          expect{subject.dock(Bike.new)}.to change {subject.num_bikes}.by(1)
        end
      end

      it 'reports bike as broken if not working' do
        bike = subject.release_bike
        expect(subject.dock(bike)).to eq "Bike reported as broken" unless bike.working
      end
    end

    describe '#release_bike' do
      it 'raises an error when there are no bikes' do
        if subject.num_bikes == 0
          expect { subject.release_bike }.to raise_error 'No bikes available'
        end
      end

      it 'reduces num_bikes by 1 when there are are bikes at station' do
        if subject.num_bikes > 0
          expect{ subject.release_bike }.to change { subject.num_bikes }.by(-1)
        end
      end

      it "release a bike if working" do
        expect(subject.release_bike).to be_a(Bike) if subject.num_working_bikes > 0
      end

      it "won't release bike if all broken" do
        expect{ subject.release_bike }.to raise_error "sorry all bikes broken" if subject.num_working_bikes <= 0
      end
    end

    it { expect(subject.num_bikes).to eq subject.current_bikes.length }

    it 'returns number of working bikes in docking station' do
      subject.current_bikes.sample.working = false
      expect(subject.num_working_bikes).to eq (subject.capacity - 1)
    end

end
