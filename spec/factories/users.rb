FactoryBot.define do
  factory :user do
    email {Faker::internet.email}
    password {Faker::internet.password}
  end
end
