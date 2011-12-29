require "spec_helper"

describe CurriculumsController do
  describe "routing" do

    it "routes to #index" do
      get("/curriculums").should route_to("curriculums#index")
    end

    it "routes to #new" do
      get("/curriculums/new").should route_to("curriculums#new")
    end

    it "routes to #show" do
      get("/curriculums/1").should route_to("curriculums#show", :id => "1")
    end

    it "routes to #edit" do
      get("/curriculums/1/edit").should route_to("curriculums#edit", :id => "1")
    end

    it "routes to #create" do
      post("/curriculums").should route_to("curriculums#create")
    end

    it "routes to #update" do
      put("/curriculums/1").should route_to("curriculums#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/curriculums/1").should route_to("curriculums#destroy", :id => "1")
    end

  end
end
