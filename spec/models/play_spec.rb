require "rails_helper"

RSpec.describe Play, type: :model do
  it { is_expected.to respond_to(:number_of_players) }
  it { is_expected.to respond_to(:rating) }

  it { is_expected.to belong_to(:kingdom) }

  it { is_expected.to validate_presence_of(:number_of_players) }
  it { is_expected.to validate_presence_of(:rating) }

  it do
    is_expected.to validate_numericality_of(:number_of_players).is_greater_than(1).is_less_than(7)
  end

  it { is_expected.to validate_numericality_of(:rating).is_greater_than(0).is_less_than(6) }
end
