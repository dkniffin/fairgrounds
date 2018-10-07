require "rails_helper"

RSpec.describe Kingdom, type: :model do
  it { is_expected.to respond_to(:name) }

  it { is_expected.to have_many(:cards) }
  it { is_expected.to have_many(:plays) }

  it { is_expected.to validate_presence_of(:name) }

  pending "#play_count"
  pending "#rating"
  pending "#materials"
  pending "#supply_cards"
  pending "#non_supply_cards"
  pending "#all_cards"
  pending "#card_dependencies"
end
