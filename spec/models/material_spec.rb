require "rails_helper"

RSpec.describe Material, type: :model do
  it { is_expected.to respond_to(:name) }
  it { is_expected.to respond_to(:image_name) }
  it { is_expected.to respond_to(:token) }
  it { is_expected.to respond_to(:mat) }

  pending "#image_path"
end
