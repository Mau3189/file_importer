require 'rails_helper'

describe Datafile do
  subject(:datafile) { FactoryGirl.build(:datafile) }

  it "has a valid Factory" do
    expect(datafile).to be_valid
  end

  # validations
  it { is_expected.to validate_uniqueness_of :filename }

  # columns
  it { is_expected.to respond_to(:filename) }
  it { is_expected.to validate_presence_of(:filename) }
end
