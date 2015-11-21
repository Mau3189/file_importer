require 'rails_helper'

describe Record do
  subject(:record) { FactoryGirl.build(:record) }

  it "has a valid Factory" do
    expect(record).to be_valid
  end

  # associations
  it { is_expected.to belong_to(:datafile) }
  it { is_expected.to respond_to(:datafile) }
  it { is_expected.to validate_presence_of(:datafile) }

  # columns
  it { is_expected.to respond_to(:campaign_name) }
  it { is_expected.to respond_to(:impressions) }
  it { is_expected.to respond_to(:cost) }
  it { is_expected.to respond_to(:clicks) }
  it { is_expected.to respond_to(:timestamp) }

end