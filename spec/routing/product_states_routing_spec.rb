require "spec_helper"

describe ProductStatesController do
  describe "routing" do

    it "routes to #index" do
      get("/product_states").should route_to("product_states#index")
    end

    it "routes to #new" do
      get("/product_states/new").should route_to("product_states#new")
    end

    it "routes to #show" do
      get("/product_states/1").should route_to("product_states#show", :id => "1")
    end

    it "routes to #edit" do
      get("/product_states/1/edit").should route_to("product_states#edit", :id => "1")
    end

    it "routes to #create" do
      post("/product_states").should route_to("product_states#create")
    end

    it "routes to #update" do
      put("/product_states/1").should route_to("product_states#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/product_states/1").should route_to("product_states#destroy", :id => "1")
    end

  end
end
