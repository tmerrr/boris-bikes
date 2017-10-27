require 'bike'

describe Bike do
  it { is_expected.to respond_to(:working?) }

  it { expect(subject.working?).to be(true).or be(false) }

end
