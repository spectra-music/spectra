require 'spec_helper'

describe AlbumsController, type: :routing do
  describe 'routing' do
    it { should route(:get, '/albums').to('albums#index') }
    it { should route(:get, '/albums/spectra').to('albums#show', id: 'spectra') }
    it { should route(:put, '/albums/spectra').to('albums#update', id: 'spectra') }
  end
end