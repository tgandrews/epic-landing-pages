FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "TestUser#{n}" }
    sequence(:email) { |n| "test#{n}@gmail.com" }
    password 'pw' 
  end
end
