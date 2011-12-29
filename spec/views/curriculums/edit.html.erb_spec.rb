require 'spec_helper'

describe "curriculums/edit.html.erb" do
  before(:each) do
    @curriculum = assign(:curriculum, stub_model(Curriculum,
      :user => nil,
      :lank => 1,
      :explain => "MyText"
    ))
  end

  it "renders the edit curriculum form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => curriculums_path(@curriculum), :method => "post" do
      assert_select "input#curriculum_user", :name => "curriculum[user]"
      assert_select "input#curriculum_lank", :name => "curriculum[lank]"
      assert_select "textarea#curriculum_explain", :name => "curriculum[explain]"
    end
  end
end
