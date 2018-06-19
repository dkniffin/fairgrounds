FactoryBot.define do
  factory :play do
    kingdom { create(:kingdom) }
    number_of_players { (2..6).to_a.sample }
    rating { (1..5).to_a.sample }
  end
end
