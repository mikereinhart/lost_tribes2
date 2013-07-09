FactoryGirl.define do
  factory :user1, class: User do
    # id 1
    name Faker::Name.name
    email Faker::Internet.email
    zip 44122
    password "password"
    password_confirmation "password"
  end

  factory :user2, class: User do
    # id 2
    name Faker::Name.name
    email Faker::Internet.email
    zip 44122
    password "wordpass"
    password_confirmation "wordpass"
  end
end

