require 'rails_helper'

RSpec.describe "records/new", type: :view do
  before(:each) do
    assign(:record, Record.new(
      :campaign_name => "MyString",
      :impressions => "MyString",
      :clicks => 1,
      :cost => 1
    ))
  end

  it "renders new record form" do
    render

    assert_select "form[action=?][method=?]", records_path, "post" do

      assert_select "input#record_campaign_name[name=?]", "record[campaign_name]"

      assert_select "input#record_impressions[name=?]", "record[impressions]"

      assert_select "input#record_clicks[name=?]", "record[clicks]"

      assert_select "input#record_cost[name=?]", "record[cost]"
    end
  end
end
