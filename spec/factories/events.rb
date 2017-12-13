FactoryBot.define do
  factory :event do

    name { Faker::Lorem.words(3).join(' ') }
    location { Faker::Address.city }
    category "Movie"
    price { Faker::Commerce.price }
    capacity 20_000
    starts_at {Faker::Date.between(2.days.ago, Date.today)}
    ends_at   {Faker::Date.between(2.days.ago, Date.today)}
    description      { Faker::Lorem.sentence(40) }
    includes_food   true
    includes_drinks true
    user              { build(:user) }

    trait :active do
      active true
    end

    trait :inactive do
      active false
    end

  end
end
