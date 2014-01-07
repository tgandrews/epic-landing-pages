# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :landing_page do
    sequence(:url) { |n| "test#{n}.com"}
    association :owner, factory: :user
  end
end
