FactoryBot.define do
  factory :event do

    name              { Faker::Lorem.words(3).join(' ') }
    location          { Faker::Address.city }
    category          "Movie"
    price             { Faker::Commerce.price }
    capacity          50000
    starts_at         {Faker::Date.forward(0).to_formatted_s(:short)}
    ends_at           {Faker::Date.forward(1).to_formatted_s(:short)}
    description       { Faker::Lorem.sentence(40) }
    includes_food     true
    includes_drinks   true
    user              { build(:user) }

    trait :active do
      active true
    end

    trait :inactive do
      active false
    end

  end
end
