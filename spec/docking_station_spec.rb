require 'Docking_station.rb'

describe DockingStation do
    it {is_expected.to be_a(DockingStation)}

# describe '.release_bike' do
    # context "When calling respond_to" do
      it { is_expected.to respond_to(:release_bike)}
    # end
  # end
end
