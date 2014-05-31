require 'spec_helper'

describe ArtistsController, type: :routing do
  describe 'routing' do
    it { should route(:get, '/artists').to('artists#index') }
    it { should route(:get, '/artists/chipzel').to('artists#show', id: 'chipzel')}
    it { should route(:get, '/artists/chipzel/edit').to('artists#edit', id: 'chipzel')}
  end
end
