require 'rails_helper'

RSpec.describe "records/show", type: :view do
  before(:each) do
    @record = assign(:record, Record.create!(
      :campaign_name => "Campaign Name",
      :impressions => "Impressions",
      :clicks => 1,
      :cost => 2,
      :datafile => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Campaign Name/)
    expect(rendered).to match(/Impressions/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(//)
  end
end
