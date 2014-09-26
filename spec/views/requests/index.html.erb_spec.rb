require 'rails_helper'

RSpec.describe "requests/index", :type => :view do
  before(:each) do
    assign(:requests, [
      Request.create!(
        :isbn => "Isbn",
        :title => "Title",
        :publisher => "Publisher",
        :text => "Text",
        :name => "Name"
      ),
      Request.create!(
        :isbn => "Isbn",
        :title => "Title",
        :publisher => "Publisher",
        :text => "Text",
        :name => "Name"
      )
    ])
  end

  it "renders a list of requests" do
    render
    assert_select "tr>td", :text => "Isbn".to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Publisher".to_s, :count => 2
    assert_select "tr>td", :text => "Text".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
