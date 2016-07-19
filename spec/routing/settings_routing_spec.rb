require 'rails_helper'

describe SettingsController, type: :routing do
  describe 'routing' do
    it { should route(:get, '/settings').to('settings#index') }
    it { should route(:post, '/settings').to('settings#create')}
    it { should route(:get, '/settings/uuid').to('settings#show', var:'uuid') }
    it { should route(:put, '/settings/uuid').to('settings#update', var:'uuid') }
    it { should route(:patch, '/settings/uuid').to('settings#update', var:'uuid') }
    it { should route(:delete, '/settings/uuid').to('settings#destroy', var:'uuid') }
    it { should_not route(:get, '/settings/uuid/edit').to('settings#edit', var:'uuid') }
    it { should_not route(:get, '/settings/uuid/new').to('settings#new', var:'uuid') }
  end
end
