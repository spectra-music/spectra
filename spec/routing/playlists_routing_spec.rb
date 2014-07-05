require "spec_helper"

describe PlaylistsController, type: :routing do
  describe "routing" do
    it { should route(:get, '/playlists').to('playlists#index') }
    it { should route(:get, '/playlists/hip').to('playlists#show', id: 'hip') }
    it { should route(:post, '/playlists').to('playlists#create') }
    it { should route(:put, '/playlists/hip').to('playlists#update', id: 'hip') }
    it { should route(:delete, '/playlists/hip').to('playlists#destroy', id: 'hip') }
    it { should_not route(:get, '/playlists/hip/edit').to('playlists#edit', id: 'hip') }
    it { should_not route(:get, '/playlists/new').to('playlists#new') }
  end
end
