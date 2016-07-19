require 'rails_helper'

describe "Tracks", :type => :request do
  describe "GET /tracks" do
    it "works! (now write some real specs)" do
      get tracks_path
      expect(response.status).to be(200)
    end
  end
end
