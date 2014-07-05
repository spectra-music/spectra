require "spec_helper"

describe TracksController, type: :routing do
  describe "routing" do
    it { should route(:get, '/tracks').to('tracks#index') }
    it { should route(:get, '/tracks/spectra').to('tracks#show', id: 'spectra') }
    it { should route(:post, '/tracks').to('tracks#create') }
    it { should route(:put, '/tracks/spectra').to('tracks#update', id: 'spectra') }
    it { should route(:delete, '/tracks/spectra').to('tracks#destroy', id: 'spectra') }
    it { should_not route(:get, '/tracks/spectra/edit').to('tracks#edit', id: 'spectra') }
    it { should_not route(:get, '/tracks/new').to('tracks#new') }
  end
end
