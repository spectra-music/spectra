require 'spec_helper'

describe AlbumsController, type: :routing do
  describe 'routing' do
    it { should route(:get, '/albums').to('albums#all') }
    it { should route(:get, '/artists/chipzel/albums').to('albums#index', artist_id: 'chipzel') }
    it { should route(:get, '/artists/chipzel/albums/spectra').to('albums#show', id: 'spectra', artist_id: 'chipzel') }
    it { should route(:get, '/artists/chipzel/albums/spectra/edit').to('albums#edit', id: 'spectra', artist_id: 'chipzel') }
    it { should route(:put, '/artists/chipzel/albums/spectra').to('albums#update', id: 'spectra', artist_id: 'chipzel') }
    it { should route(:delete, '/artists/chipzel/albums/spectra').to('albums#destroy', id: 'spectra', artist_id: 'chipzel') }
  end
end
