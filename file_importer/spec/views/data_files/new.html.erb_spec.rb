require 'rails_helper'

RSpec.describe "data_files/new", type: :view do
  before(:each) do
    assign(:data_file, DataFile.new(
      :filename => "MyString"
    ))
  end

  it "renders new data_file form" do
    render

    assert_select "form[action=?][method=?]", data_files_path, "post" do

      assert_select "input#data_file_filename[name=?]", "data_file[filename]"
    end
  end
end
