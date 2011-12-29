require "spec_helper"

describe CurriculumsSubjectsController do
  describe "routing" do

    it "routes to #index" do
      get("/curriculums_subjects").should route_to("curriculums_subjects#index")
    end

    it "routes to #new" do
      get("/curriculums_subjects/new").should route_to("curriculums_subjects#new")
    end

    it "routes to #show" do
      get("/curriculums_subjects/1").should route_to("curriculums_subjects#show", :id => "1")
    end

    it "routes to #edit" do
      get("/curriculums_subjects/1/edit").should route_to("curriculums_subjects#edit", :id => "1")
    end

    it "routes to #create" do
      post("/curriculums_subjects").should route_to("curriculums_subjects#create")
    end

    it "routes to #update" do
      put("/curriculums_subjects/1").should route_to("curriculums_subjects#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/curriculums_subjects/1").should route_to("curriculums_subjects#destroy", :id => "1")
    end

  end
end
