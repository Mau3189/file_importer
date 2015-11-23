require 'rails_helper'

RSpec.describe 'datafiles/edit', type: :view do
  before(:each) do
    @datafile = assign(:datafile, Datafile.create!(filename: 'MyString'))
  end

  it 'renders the edit datafile form' do
    render
    assert_select(
      'form[action=?][method=?]',
      datafile_path(@datafile),
      'post'
    ) do
      assert_select 'input#datafile_filename[name=?]', 'datafile[filename]'
    end
  end
end
