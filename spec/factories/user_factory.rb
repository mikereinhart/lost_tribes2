FactoryGirl.define do
  factory :user1, class: User do
    # id 1
    name Faker::Name.name
    email Faker::Internet.email
    zip 44122
    password "password"
    password_confirmation "password"
  end

  factory :vendor, class: User do
    # id 2
    name Faker::Name.name
    email Faker::Internet.email
    vendor true 
    zip 44122
    street_address "2333 norwood rd"
    city "beachwood"
    state 'Ohio'
    phone_number "215 666 7777"
    password "wordpass"
    password_confirmation "wordpass"
  end
end

