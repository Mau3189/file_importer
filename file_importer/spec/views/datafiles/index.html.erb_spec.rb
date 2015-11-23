require 'rails_helper'

RSpec.describe 'datafiles/index', type: :view do
  before(:each) do
    assign(:datafiles, [
      Datafile.create!(filename: 'Filename'),
      Datafile.create!(filename: 'Filename1')
    ])
  end

  it 'renders a list of datafiles' do
    render
    assert_select 'tr>td', text: 'Filename'.to_s, count: 1
    assert_select 'tr>td', text: 'Filename1'.to_s, count: 1
  end
end
