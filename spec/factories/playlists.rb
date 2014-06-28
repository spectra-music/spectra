# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :playlist do
    name "MyString"
    initialize_with { Playlist.find_or_create_by(name: name) }
  end
end
