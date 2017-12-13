FactoryBot.define do
  factory :profile do
    first_name  {Fake::Name.first_name}
    last_name   {Faker::Name.last_name}
    bio         {Faker::Lorem.sentence}
  end
end
