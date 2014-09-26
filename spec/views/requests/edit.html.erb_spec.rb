require 'rails_helper'

RSpec.describe "requests/edit", :type => :view do
  before(:each) do
    @request = assign(:request, Request.create!(
      :isbn => "MyString",
      :title => "MyString",
      :publisher => "MyString",
      :text => "MyString",
      :name => "MyString"
    ))
  end

  it "renders the edit request form" do
    render

    assert_select "form[action=?][method=?]", request_path(@request), "post" do

      assert_select "input#request_isbn[name=?]", "request[isbn]"

      assert_select "input#request_title[name=?]", "request[title]"

      assert_select "input#request_publisher[name=?]", "request[publisher]"

      assert_select "input#request_text[name=?]", "request[text]"

      assert_select "input#request_name[name=?]", "request[name]"
    end
  end
end
