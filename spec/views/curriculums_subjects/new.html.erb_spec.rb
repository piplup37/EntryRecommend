require 'spec_helper'

describe "curriculums_subjects/new.html.erb" do
  before(:each) do
    assign(:curriculums_subject, stub_model(CurriculumsSubject,
      :curriculum => nil,
      :subject => nil
    ).as_new_record)
  end

  it "renders new curriculums_subject form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => curriculums_subjects_path, :method => "post" do
      assert_select "input#curriculums_subject_curriculum", :name => "curriculums_subject[curriculum]"
      assert_select "input#curriculums_subject_subject", :name => "curriculums_subject[subject]"
    end
  end
end
