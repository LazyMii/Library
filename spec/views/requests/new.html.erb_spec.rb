require 'rails_helper'

RSpec.describe "requests/new", :type => :view do
  before(:each) do
    assign(:request, Request.new(
      :isbn => "MyString",
      :title => "MyString",
      :publisher => "MyString",
      :text => "MyString",
      :name => "MyString"
    ))
  end

  it "renders new request form" do
    render

    assert_select "form[action=?][method=?]", requests_path, "post" do

      assert_select "input#request_isbn[name=?]", "request[isbn]"

      assert_select "input#request_title[name=?]", "request[title]"

      assert_select "input#request_publisher[name=?]", "request[publisher]"

      assert_select "input#request_text[name=?]", "request[text]"

      assert_select "input#request_name[name=?]", "request[name]"
    end
  end
end
