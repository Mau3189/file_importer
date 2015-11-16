require 'rails_helper'

RSpec.describe "records/edit", type: :view do
  before(:each) do
    @record = assign(:record, Record.create!(
      :campaign_name => "MyString",
      :impressions => "MyString",
      :clicks => 1,
      :cost => 1
    ))
  end

  it "renders the edit record form" do
    render

    assert_select "form[action=?][method=?]", record_path(@record), "post" do

      assert_select "input#record_campaign_name[name=?]", "record[campaign_name]"

      assert_select "input#record_impressions[name=?]", "record[impressions]"

      assert_select "input#record_clicks[name=?]", "record[clicks]"

      assert_select "input#record_cost[name=?]", "record[cost]"
    end
  end
end