require 'spec_helper'

describe "Artists", :type => :request do
  describe "GET /artists" do
    it "works! (now write some real specs)" do
      get artists_path
      expect(response.status).to be(200)
    end
  end
end
