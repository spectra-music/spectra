require "spec_helper"

describe FlexlistsController, type: :routing do
  describe "routing" do
    it { should route(:get, '/flexlists').to('flexlists#index') }
    it { should route(:get, '/flexlists/hip').to('flexlists#show', id: 'hip') }
    it { should route(:post, '/flexlists').to('flexlists#create') }
    it { should route(:put, '/flexlists/hip').to('flexlists#update', id: 'hip') }
    it { should route(:delete, '/flexlists/hip').to('flexlists#destroy', id: 'hip') }
    it { should_not route(:get, '/flexlists/hip/edit').to('flexlists#edit', id: 'hip') }
    it { should_not route(:get, '/flexlists/new').to('flexlists#new') }
  end
end
