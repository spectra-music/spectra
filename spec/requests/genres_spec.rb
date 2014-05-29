require 'spec_helper'

describe 'Genres', type: :request do
  describe 'GET /genres' do
    it 'works! (now write some real specs)' do
      get genres_path
      expect(response.status).to be(200)
    end
  end
end
