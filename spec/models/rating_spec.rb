require "rails_helper"

RSpec.describe Rating, type: :model do
  it { is_expected.to respond_to(:value) }

  it { is_expected.to belong_to(:kingdom) }
end
