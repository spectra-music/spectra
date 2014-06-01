# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :genre do
    name 'Electronic'
    initialize_with { Genre.find_or_create_by(name: name) }
  end
end
