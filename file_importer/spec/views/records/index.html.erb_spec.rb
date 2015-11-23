require 'rails_helper'

RSpec.describe 'records/index', type: :view do
  let(:datafile) { FactoryGirl.create(:datafile) }

  before(:each) do
    assign(:records, [
      Record.create!(
        campaign_name: 'Campaign Name',
        impressions: 'Impressions',
        clicks: 1,
        cost: 2,
        datafile: datafile
      ),
      Record.create!(
        campaign_name: 'Campaign Name',
        impressions: 'Impressions',
        clicks: 1,
        cost: 2,
        datafile: datafile
      )
    ])
  end

  it 'renders a list of records' do
    render
    assert_select 'tr>td', text: 'Campaign Name'.to_s, count: 2
    assert_select 'tr>td', text: 'Impressions'.to_s, count: 2
    assert_select 'tr>td', text: 1.to_s, count: 2
    assert_select 'tr>td', text: 2.to_s, count: 2
  end
end
