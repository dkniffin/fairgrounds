# == Schema Information
#
# Table name: cards
#
#  action       :boolean
#  attack       :boolean
#  boon         :boolean
#  castle       :boolean
#  cost         :integer
#  created_at   :datetime         not null
#  curse        :boolean
#  doom         :boolean
#  duration     :boolean
#  event        :boolean
#  fate         :boolean
#  gathering    :boolean
#  heirloom     :boolean
#  hex          :boolean
#  id           :integer          not null, primary key
#  landmark     :boolean
#  looter       :boolean
#  name         :string
#  night        :boolean
#  potion_cost  :integer
#  prize        :boolean
#  reaction     :boolean
#  reserve      :boolean
#  shelter      :boolean
#  special_cost :boolean
#  spirit       :boolean
#  state        :boolean
#  supply       :boolean
#  trash        :boolean
#  traveller    :boolean
#  treasure     :boolean
#  updated_at   :datetime         not null
#  victory      :boolean
#  zombie       :boolean
#

class Card < ApplicationRecord
  has_many :kingdom_memberships, dependent: :destroy
  has_many :kingdoms, through: :kingdom_memberships
  has_many :card_dependencies, dependent: :destroy
  has_many :card_dependents, as: :dependency, class_name: "CardDependency", dependent: :destroy, inverse_of: :dependency
  has_many :dependents, through: :card_dependents, source: :card, class_name: "Card"

  validates :name, uniqueness: true

  scope :supply_cards, -> { where(supply: true) }
  scope :non_supply_cards, -> { where(supply: false) }

  def image_path
    "/card-images/#{name.tr(" ", "_")}.jpg"
  end

  def dependencies
    card_dependencies.map(&:dependency).flatten
  end
end
