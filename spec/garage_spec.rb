require 'garage.rb'


describe Garage do
  
  it { expect(subject).to respond_to(:receive) }
  it { expect(subject).to respond_to(:fix) }
  it { expect(subject).to respond_to(:give) }

end
