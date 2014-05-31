require "spec_helper"

describe TracksController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/tracks").to route_to("tracks#index")
    end

    it "routes to #new" do
      expect(:get => "/tracks/new").to route_to("tracks#new")
    end

    it "routes to #show" do
      expect(:get => "/tracks/1").to route_to("tracks#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/tracks/1/edit").to route_to("tracks#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/tracks").to route_to("tracks#create")
    end

    it "routes to #update" do
      expect(:put => "/tracks/1").to route_to("tracks#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/tracks/1").to route_to("tracks#destroy", :id => "1")
    end

  end
end
