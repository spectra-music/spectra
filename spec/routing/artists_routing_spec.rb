require "spec_helper"

describe ArtistsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/artists").to route_to("artists#index")
    end

    it "routes to #new" do
      expect(:get => "/artists/new").to route_to("artists#new")
    end

    it "routes to #show" do
      expect(:get => "/artists/1").to route_to("artists#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/artists/1/edit").to route_to("artists#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/artists").to route_to("artists#create")
    end

    it "routes to #update" do
      expect(:put => "/artists/1").to route_to("artists#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/artists/1").to route_to("artists#destroy", :id => "1")
    end

  end
end
