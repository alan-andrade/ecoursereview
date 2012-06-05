require 'spec_helper'

describe "courses/show" do
  before(:each) do
    @course = assign(:course, stub_model(Course,
      :provider => "Provider",
      :title => "Title",
      :url => "Url",
      :subject => "Subject"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Provider/)
    rendered.should match(/Title/)
    rendered.should match(/Url/)
    rendered.should match(/Subject/)
  end
end
