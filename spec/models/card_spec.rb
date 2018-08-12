require "rails_helper"

RSpec.describe Card, type: :model do
  it { is_expected.to respond_to(:name) }
  it { is_expected.to respond_to(:event) }
  it { is_expected.to respond_to(:action) }
  it { is_expected.to respond_to(:duration) }
  it { is_expected.to respond_to(:attack) }
  it { is_expected.to respond_to(:reaction) }
  it { is_expected.to respond_to(:treasure) }
  it { is_expected.to respond_to(:reserve) }
  it { is_expected.to respond_to(:traveller) }
  it { is_expected.to respond_to(:victory) }
  it { is_expected.to respond_to(:curse) }
  it { is_expected.to respond_to(:trash) }
  it { is_expected.to respond_to(:prize) }
  it { is_expected.to respond_to(:looter) }
  it { is_expected.to respond_to(:shelter) }
  it { is_expected.to respond_to(:landmark) }
  it { is_expected.to respond_to(:castle) }
  it { is_expected.to respond_to(:gathering) }
  it { is_expected.to respond_to(:hex) }
  it { is_expected.to respond_to(:fate) }
  it { is_expected.to respond_to(:night) }
  it { is_expected.to respond_to(:heirloom) }
  it { is_expected.to respond_to(:doom) }
  it { is_expected.to respond_to(:state) }
  it { is_expected.to respond_to(:spirit) }
  it { is_expected.to respond_to(:boon) }
  it { is_expected.to respond_to(:zombie) }

  it { is_expected.to have_many(:kingdoms) }

  it { is_expected.to validate_uniqueness_of(:name) }
end
