require 'rails_helper'

RSpec.describe "data_files/show", type: :view do
  before(:each) do
    @data_file = assign(:data_file, DataFile.create!(
      :filename => "Filename"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Filename/)
  end
end
