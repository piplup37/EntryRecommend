require 'spec_helper'

describe "curriculums/new.html.erb" do
  before(:each) do
    assign(:curriculum, stub_model(Curriculum,
      :user => nil,
      :lank => 1,
      :explain => "MyText"
    ).as_new_record)
  end

  it "renders new curriculum form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => curriculums_path, :method => "post" do
      assert_select "input#curriculum_user", :name => "curriculum[user]"
      assert_select "input#curriculum_lank", :name => "curriculum[lank]"
      assert_select "textarea#curriculum_explain", :name => "curriculum[explain]"
    end
  end
end
