require 'rails_helper'

RSpec.describe "data_files/index", type: :view do
  before(:each) do
    assign(:data_files, [
      DataFile.create!(
        :filename => "Filename"
      ),
      DataFile.create!(
        :filename => "Filename"
      )
    ])
  end

  it "renders a list of data_files" do
    render
    assert_select "tr>td", :text => "Filename".to_s, :count => 2
  end
end
