FactoryBot.define do
  factory :dream do
    title { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph }
    date { Faker::Date.between(from: 1.year.ago, to: Time.zone.today) }
    duration { Faker::Number.between(from: 0, to: 24) }
    association :user
    association :category
  end
end
