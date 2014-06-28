# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :playlist_track do
    track_num 1
    track
    playable { association(:playlist) }
  end
end
