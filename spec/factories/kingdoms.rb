FactoryBot.define do
  factory :kingdom do
    name { Faker::Lorem.sentence }
    cards { create_list(:card, 10) }
  end
end
