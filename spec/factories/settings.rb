# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :settings do
    var 'uuid'
    value '1234'
    initialize_with { Settings.find_or_create_by(var: var, value: value)}
  end
end
