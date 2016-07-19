require 'rails_helper'

describe ImportController, type: :routing do
  describe 'routing' do
    it { should route(:get, '/import').to('import#index')}
  end
end