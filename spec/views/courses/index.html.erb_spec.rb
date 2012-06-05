require 'spec_helper'

describe "courses/index" do
  before(:each) do
    assign(:courses, [
      stub_model(Course,
        :provider => "Provider",
        :title => "Title",
        :url => "Url",
        :subject => "Subject"
      ),
      stub_model(Course,
        :provider => "Provider",
        :title => "Title",
        :url => "Url",
        :subject => "Subject"
      )
    ])
  end

  it "renders a list of courses" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Provider".to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    assert_select "tr>td", :text => "Subject".to_s, :count => 2
  end
end
