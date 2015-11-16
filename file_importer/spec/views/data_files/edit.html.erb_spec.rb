require 'rails_helper'

RSpec.describe "data_files/edit", type: :view do
  before(:each) do
    @data_file = assign(:data_file, DataFile.create!(
      :filename => "MyString"
    ))
  end

  it "renders the edit data_file form" do
    render

    assert_select "form[action=?][method=?]", data_file_path(@data_file), "post" do

      assert_select "input#data_file_filename[name=?]", "data_file[filename]"
    end
  end
end
