require 'spec_helper'

describe "courses/new" do
  before(:each) do
    assign(:course, stub_model(Course,
      :provider => "MyString",
      :title => "MyString",
      :url => "MyString",
      :subject => "MyString"
    ).as_new_record)
  end

  it "renders new course form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => courses_path, :method => "post" do
      assert_select "input#course_provider", :name => "course[provider]"
      assert_select "input#course_title", :name => "course[title]"
      assert_select "input#course_url", :name => "course[url]"
      assert_select "input#course_subject", :name => "course[subject]"
    end
  end
end
