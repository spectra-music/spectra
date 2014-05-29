require 'spec_helper'

describe Track do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:artist) }
  it { should validate_presence_of(:album) }
  it { should validate_presence_of(:track_id) }
  it { should validate_presence_of(:location) }

  #it { should validate_uniqueness_of(:title).scoped_to(:album).case_insensitive }
end

