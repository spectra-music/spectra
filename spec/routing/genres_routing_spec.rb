require 'spec_helper'

describe GenresController, type: :routing do
  describe 'routing' do
    it { should route(:get, '/genres').to('genres#index') }
    it { should route(:get, '/genres/electronic').to('genres#show', id: 'electronic') }
  end
end
