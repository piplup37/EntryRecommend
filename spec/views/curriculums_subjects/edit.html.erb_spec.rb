require 'spec_helper'

describe "curriculums_subjects/edit.html.erb" do
  before(:each) do
    @curriculums_subject = assign(:curriculums_subject, stub_model(CurriculumsSubject,
      :curriculum => nil,
      :subject => nil
    ))
  end

  it "renders the edit curriculums_subject form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => curriculums_subjects_path(@curriculums_subject), :method => "post" do
      assert_select "input#curriculums_subject_curriculum", :name => "curriculums_subject[curriculum]"
      assert_select "input#curriculums_subject_subject", :name => "curriculums_subject[subject]"
    end
  end
end
