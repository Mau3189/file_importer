require 'rails_helper'

RSpec.describe 'datafiles/show', type: :view do
  before(:each) do
    @datafile = assign(:datafile, Datafile.create!(filename: 'Filename'))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Filename/)
  end
end
