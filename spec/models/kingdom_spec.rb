require "rails_helper"

RSpec.describe Kingdom, type: :model do
  it { is_expected.to respond_to(:name) }

  it { is_expected.to have_many(:cards) }
  it { is_expected.to have_many(:plays) }

  it { is_expected.to validate_presence_of(:name) }
end
