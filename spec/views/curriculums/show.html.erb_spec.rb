require 'spec_helper'

describe "curriculums/show.html.erb" do
  before(:each) do
    @curriculum = assign(:curriculum, stub_model(Curriculum,
      :user => nil,
      :lank => 1,
      :explain => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
  end
end
