require 'rails_helper'
include ActionDispatch::TestProcess

describe Record do
  subject(:record) { FactoryGirl.build(:record) }

  it 'has a valid Factory' do
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

  describe '.import' do
    let(:datafile) { FactoryGirl.create :datafile, filename: 'test' }
    let(:zip_csv_file) { fixture_file_upload('test.zip', 'application/zip') }
    let(:action) do
      Record.import(datafile, zip_csv_file)
    end

    # matches test.csv file contents
    it 'loads 3 new records' do
      action
      expect(Record.count).to eq 3
    end

    specify 'first record clicks should be' do
      action
      expect(Record.first.clicks).to eq 10
    end
  end
end
