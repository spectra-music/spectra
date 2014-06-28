require 'rails_helper'

RSpec.describe "Playlists", :type => :request do
  describe "GET /playlists" do
    it "works! (now write some real specs)" do
      get playlists_path
      expect(response.status).to be(200)
    end
  end
end
