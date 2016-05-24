FactoryGirl.define do
  factory :user do
    sequence :email do |n|
      "user#{n}@example.com"
    end
    password '1superpassword'
  end
end
