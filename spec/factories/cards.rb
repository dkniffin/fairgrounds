FactoryBot.define do
  factory :card do
    sequence(:name) { |i| "#{Faker::Lorem.word} #{i}" }
  end
end
