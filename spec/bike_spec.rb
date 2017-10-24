require 'bike'

describe Bike do
  it { is_expected.to respond_to(:working?) }
  it "working to be true" do
    expect(subject.working?).to eq true
  end
end
