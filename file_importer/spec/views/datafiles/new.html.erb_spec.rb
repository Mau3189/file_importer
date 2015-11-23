require 'rails_helper'

RSpec.describe 'datafiles/new', type: :view do
  before(:each) do
    assign(:datafile, Datafile.new(filename: 'MyString'))
  end

  it 'renders new datafile form' do
    render

    assert_select "form[action=?][method=?]", datafiles_path, "post" do
      assert_select "input#datafile_filename[name=?]", "datafile[filename]"
      assert_select "input#datafile_file[name=?]", "datafile[file]"
    end
  end
end
