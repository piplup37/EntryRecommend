require 'spec_helper'

describe "curriculums_subjects/show.html.erb" do
  before(:each) do
    @curriculums_subject = assign(:curriculums_subject, stub_model(CurriculumsSubject,
      :curriculum => nil,
      :subject => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
  end
end
