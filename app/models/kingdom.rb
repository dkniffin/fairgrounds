# == Schema Information
#
# Table name: kingdoms
#
#  created_at :datetime         not null
#  id         :integer          not null, primary key
#  name       :string
#  updated_at :datetime         not null
#

class Kingdom < ApplicationRecord
  has_many :kingdom_memberships, dependent: :destroy
  has_many :cards, through: :kingdom_memberships
  has_many :plays, dependent: :destroy

  validates :name, presence: true
  # validate :validate_kindom_size

  def play_count
    plays.count
  end

  def rating
    plays.average(:rating).to_i.ceil
  end

  def materials
    dependencies_by_type[Material] || []
  end

  def supply_cards
    all_cards.select(&:supply?)
  end

  def non_supply_cards
    all_cards.reject(&:supply?)
  end

  def all_cards
    cards + card_dependencies
  end

  def card_dependencies
    dependencies_by_type[Card] || []
  end

  def play_count
    plays.count
  end

  private

  def validate_kindom_size
    errors.add(:cards, "must contain exactly 10 cards") if cards.size != 10
  end

  def dependencies_by_type
    @dependencies_by_type ||= cards.map(&:dependencies).flatten.uniq.group_by(&:class)
  end
end
