require 'spec_helper'

describe ArtistsController, type: :routing do
  describe 'routing' do

    it 'routes to #index' do
      expect(get: '/artists').to route_to('artists#index')
    end

    it 'routes to #show' do
      expect(get: '/artists/chipzel').to route_to('artists#show', id: 'chipzel')
    end

    it 'routes to #edit' do
      expect(get: '/artists/chipzel/edit').to route_to('artists#edit', id: 'chipzel')
    end
  end
end
