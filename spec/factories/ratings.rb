FactoryBot.define do
  factory :rating do
    kingdom
    value { (1..5).to_a.sample }
  end
end
