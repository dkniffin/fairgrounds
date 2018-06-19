require "rails_helper"

RSpec.describe Play, type: :model do
  it { is_expected.to respond_to(:number_of_players) }
  it { is_expected.to respond_to(:rating) }

  it { is_expected.to belong_to(:kingdom) }

  it { is_expected.to validate_presence_of(:number_of_players) }
  it { is_expected.to validate_presence_of(:rating) }

  it { is_expected.to validate_inclusion_of(:number_of_players).in_range(2..6) }
  it { is_expected.to validate_inclusion_of(:rating).in_range(1..5) }
end
