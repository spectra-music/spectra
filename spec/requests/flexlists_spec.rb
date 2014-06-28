require 'spec_helper'

describe "Flexlists", type: :request do
  describe "GET /flexlists" do
    it "works! (now write some real specs)" do
      get flexlists_path
      expect(response.status).to be(200)
    end
  end
end
