require 'spec_helper'

describe AlbumsController, :type => :routing do
  describe 'routing' do

    it 'routes to #all' do
      expect(get: '/albums').to route_to('albums#all')
    end

    it 'routes to #index' do
      expect(get: '/artists/chipzel/albums/').to route_to('albums#index', artist_id: 'chipzel')
    end

    it 'routes to #show' do
      expect(get: '/artists/chipzel/albums/spectra').to route_to('albums#show', id: 'spectra', artist_id: 'chipzel')
    end

    it 'routes to #edit' do
      expect(get: '/artists/chipzel/albums/spectra/edit').to route_to('albums#edit', id: 'spectra', artist_id: 'chipzel')
    end

    it 'routes to #update' do
      expect(put: '/artists/chipzel/albums/spectra').to route_to('albums#update', id: 'spectra', artist_id: 'chipzel')
    end

    it 'routes to #destroy' do
      expect(delete: '/artists/chipzel/albums/spectra').to route_to('albums#destroy', id: 'spectra', artist_id: 'chipzel')
    end

  end
end