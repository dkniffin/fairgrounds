require "rails_helper"

RSpec.describe Play, type: :model do
  it { is_expected.to respond_to(:number_of_players) }
  it { is_expected.to respond_to(:rating) }

  it { is_expected.to belong_to(:kingdom) }
end
