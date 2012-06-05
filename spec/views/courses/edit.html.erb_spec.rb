require 'spec_helper'

describe "courses/edit" do
  before(:each) do
    @course = assign(:course, stub_model(Course,
      :provider => "MyString",
      :title => "MyString",
      :url => "MyString",
      :subject => "MyString"
    ))
  end

  it "renders the edit course form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => courses_path(@course), :method => "post" do
      assert_select "input#course_provider", :name => "course[provider]"
      assert_select "input#course_title", :name => "course[title]"
      assert_select "input#course_url", :name => "course[url]"
      assert_select "input#course_subject", :name => "course[subject]"
    end
  end
end
