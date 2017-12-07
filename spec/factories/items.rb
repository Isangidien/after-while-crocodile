FactoryGirl.define do

  factory :item do

    name Faker::App.name
    user
  end
end
