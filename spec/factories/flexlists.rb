# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :flexlist do
    name "MyString"
    initialize_with { Flexlist.find_or_create_by(name: name) }
  end
end
