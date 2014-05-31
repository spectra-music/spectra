require "spec_helper"

describe AlbumsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/albums").to route_to("albums#index")
    end

    it "routes to #new" do
      expect(:get => "/albums/new").to route_to("albums#new")
    end

    it "routes to #show" do
      expect(:get => "/albums/1").to route_to("albums#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/albums/1/edit").to route_to("albums#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/albums").to route_to("albums#create")
    end

    it "routes to #update" do
      expect(:put => "/albums/1").to route_to("albums#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/albums/1").to route_to("albums#destroy", :id => "1")
    end

  end
end
