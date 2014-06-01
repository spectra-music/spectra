require 'spec_helper'

describe ArtistsController, type: :routing do
  describe 'routing' do
    it { should route(:get, '/artists').to('artists#index') }
    it { should route(:get, '/artists/chipzel').to('artists#show', id: 'chipzel')}
  end
end
