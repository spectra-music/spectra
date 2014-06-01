require 'spec_helper'

describe TracksController, type: :routing do
  describe 'routing' do
    it { should route(:get, '/tracks').to('tracks#index') }
    it do should route(:get, '/artists/chipzel/albums/spectra/tracks/new')
                .to('tracks#new', artist_id: 'chipzel', album_id: 'spectra') end
    it { should route(:get, '/tracks/new').to('tracks#new') }
    it do should route(:get, '/artists/chipzel/albums/spectra/tracks/spectra')
                .to('tracks#show', id: 'spectra', artist_id: 'chipzel', album_id: 'spectra') end

    it do should route(:get, '/artists/chipzel/albums/spectra/tracks/spectra/edit')
                .to('tracks#edit', id: 'spectra', artist_id: 'chipzel', album_id: 'spectra') end

    it do should route(:post, '/artists/chipzel/albums/spectra/tracks')
                .to('tracks#create', artist_id: 'chipzel', album_id: 'spectra') end
    it { should route(:post, '/tracks').to('tracks#create') }

    it do should route(:put, '/artists/chipzel/albums/spectra/tracks/spectra')
                .to('tracks#update', id: 'spectra', artist_id: 'chipzel', album_id: 'spectra') end

    it do should route(:delete, '/artists/chipzel/albums/spectra/tracks/spectra')
                .to('tracks#destroy', id: 'spectra', artist_id: 'chipzel', album_id: 'spectra') end
  end
end
