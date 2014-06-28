require "rails_helper"

RSpec.describe FlexlistsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/flexlists").to route_to("flexlists#index")
    end

    it "routes to #new" do
      expect(:get => "/flexlists/new").to route_to("flexlists#new")
    end

    it "routes to #show" do
      expect(:get => "/flexlists/1").to route_to("flexlists#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/flexlists/1/edit").to route_to("flexlists#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/flexlists").to route_to("flexlists#create")
    end

    it "routes to #update" do
      expect(:put => "/flexlists/1").to route_to("flexlists#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/flexlists/1").to route_to("flexlists#destroy", :id => "1")
    end

  end
end
