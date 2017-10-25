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
      it 'does not exceed capacity' do
        if subject.num_bikes <= subject.capacity
          bike = Bike.new
          expect { subject.dock(bike) }.to raise_error 'Station up to capacity'
        end
      end
    end

    it { is_expected.to respond_to(:num_bikes) }

    it { expect(DockingStation.new(25).capacity).to eq 25 }
    it { expect(DockingStation.new().capacity).to eq 20 }

    context 'when dock is called' do
      it 'adds 1 to num_bikes if not full' do
        if subject.num_bikes < subject.capacity
          expect{subject.dock(Bike.new)}.to change {subject.num_bikes}.by(1)
        end
      end

      it 'reports bike as broken if not working' do
        bike = subject.release_bike
        unless bike.working
            expect(subject.dock(bike)).to eq "Bike reported as broken"
        end
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
          expect{subject.release_bike}.to change {subject.num_bikes}.by(-1)
        end
      end

      it "release a bike if working" do
        if subject.current_bikes.last.working
          expect(subject.release_bike).to be_a(Bike)
        end
      end

      it "won't release bike if all broken" do
        subject.current_bikes.each { |bike| bike.working = false }

        broken_bikes = 0
        subject.current_bikes.each do |bike|
          broken_bikes += 1 unless bike.working
        end
        if broken_bikes == subject.num_bikes
            expect(subject.release_bike).to eq "sorry all bikes broken"
        end
      end

    end

    it { expect(subject.num_bikes).to eq subject.current_bikes.length }

end
