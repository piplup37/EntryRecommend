require 'spec_helper'

describe "curriculums_subjects/index.html.erb" do
  before(:each) do
    assign(:curriculums_subjects, [
      stub_model(CurriculumsSubject,
        :curriculum => nil,
        :subject => nil
      ),
      stub_model(CurriculumsSubject,
        :curriculum => nil,
        :subject => nil
      )
    ])
  end

  it "renders a list of curriculums_subjects" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
