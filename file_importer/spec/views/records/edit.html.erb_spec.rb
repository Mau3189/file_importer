require 'rails_helper'

RSpec.describe 'records/edit', type: :view do
  before(:each) do
    @record = assign(
      :record,
      Record.create!(
        campaign_name: 'MyString',
        impressions: 'MyString',
        clicks: 1,
        cost: 1,
        datafile: FactoryGirl.create(:datafile)
      )
    )
  end

  it 'renders the edit record form' do
    render

    assert_select 'form[action=?][method=?]', record_path(@record), 'post' do
      assert_select(
        'input#record_campaign_name[name=?]',
        'record[campaign_name]'
      )
      assert_select 'input#record_impressions[name=?]', 'record[impressions]'
      assert_select 'input#record_clicks[name=?]', 'record[clicks]'
      assert_select 'input#record_cost[name=?]', 'record[cost]'
      assert_select 'input#record_datafile_id[name=?]', 'record[datafile_id]'
    end
  end
end
