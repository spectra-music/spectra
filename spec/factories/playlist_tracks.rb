# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :playlist_track do
    position 1
    track
    playable { association(:playlist) }
  end
end
