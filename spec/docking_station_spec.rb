require 'docking_station.rb'

class WorkingBikeMock
  def working?
    true
  end
end

class BrokenBikeMock
  def working?
    false
  end
end

describe DockingStation do

  let(:bike) { WorkingBikeMock.new }
  let(:broken_bike) { BrokenBikeMock.new }

  describe 'when creating instance of class' do
    it { expect(DockingStation.new(25).capacity).to eq 25 }
    it { expect(DockingStation.new().capacity).to eq 20 }
  end

  describe '#dock' do
    it 'does not exceed capacity' do
      if subject.num_bikes >= subject.capacity
        expect { subject.dock(bike) }.to raise_error 'Station up to capacity'
      end
    end

    context 'when the docking station is not full' do
      it 'adds 1 to num_bikes' do
        if subject.num_bikes < subject.capacity
          expect{ subject.dock(bike) }.to change { subject.num_bikes }.by(1)
        end
      end
    end

    context 'when the bike being returned is broken' do
      it 'reports bike as broken if not working' do
        expect(subject.dock(broken_bike)).to eq "Bike reported as broken"
      end
    end
  end

  describe '#release_bike' do
    context 'when bike is broken, but working bikes are available' do
      it 'returns the next available bike' do
        subject.dock(broken_bike)
        subject.dock(bike)
        expect(subject.release_bike).to eq bike
      end
    end

    context 'when there are no bikes' do
      it 'raises an error' do
        if subject.num_bikes <= 0
          expect { subject.release_bike }.to raise_error 'No bikes available'
        end
      end
    end

    context 'when there are bikes at station' do
      it 'reduces num_bikes by 1' do
        subject.dock(bike)
        expect{ subject.release_bike }.to change { subject.num_bikes }.by(-1)
      end
    end

    context 'when there is a working bike available' do
      it "releases a bike" do
        subject.dock(bike)
        expect(subject.release_bike).to eq bike
      end
    end

    # => using double syntax to isolate test
    it 'releases a working bike' do
      subject.dock(bike)
      expect(subject.release_bike). to be_working
    end

    context 'when all remaining bikes are broken' do
      it "won't release bike if all broken" do
        subject.dock(broken_bike)
        expect{ subject.release_bike }.to raise_error "sorry all bikes broken"
      end
    end
  end

  describe '#num_bikes' do
    it { expect(subject.num_bikes).to eq subject.bikes.length }
  end

  describe '#num_working_bikes' do
    it 'returns number of working bikes in docking station' do
      subject.dock(bike)
      expect{ subject.bikes.pop }.to change { subject.num_working_bikes }.by(-1)
    end
  end

end
