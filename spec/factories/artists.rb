FactoryGirl.define do
  factory :artist do
    name 'Chipzel'
    rating 5
    initialize_with { Artist.find_or_create_by(name: name)}
  end
end