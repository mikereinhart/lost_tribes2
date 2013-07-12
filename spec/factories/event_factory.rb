FactoryGirl.define do
  factory :event1, class: Event do
    # id 1
    title "Brkyn Party"
    date "8/9/13"
    street_address "10 Midwood St"
    street_address2 "Apt 10"
    city "Brooklyn"
    state "NY"
    zip_code "11225"
    created_at Time.now
    updated_at Time.now
    description "This is going to be a huge beer party."
  end

  factory :event2, class: Event do
     # id 1
    title "Beer Tasting"
    date "8/10/13"
    street_address "10 E 21st St"
    street_address2 ""
    city "New York"
    state "NY"
    zip_code "10010"
    created_at Time.now
    updated_at Time.now
    description "very classy."
  end

  factory :updated_event, class: Event do
    title 'my updated Party'
    date '8/8/14'
    city "Queens"
  end

  factory :invalid_event, class: Event do
    title nil
    date nil
  end
end


