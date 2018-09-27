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
  validate :validate_kindom_size

  def rating
    plays.average(:rating).to_i.ceil
  end

  def play_count
    plays.count
  end

  private

  def validate_kindom_size
    errors.add(:cards, "must contain exactly 10 cards") if cards.size != 10
  end
end
