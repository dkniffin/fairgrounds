# == Schema Information
#
# Table name: cards
#
#  action     :boolean
#  attack     :boolean
#  boon       :boolean
#  castle     :boolean
#  created_at :datetime         not null
#  curse      :boolean
#  doom       :boolean
#  duration   :boolean
#  event      :boolean
#  fate       :boolean
#  gathering  :boolean
#  heirloom   :boolean
#  hex        :boolean
#  id         :integer          not null, primary key
#  landmark   :boolean
#  looter     :boolean
#  name       :string
#  night      :boolean
#  prize      :boolean
#  reaction   :boolean
#  reserve    :boolean
#  shelter    :boolean
#  spirit     :boolean
#  state      :boolean
#  trash      :boolean
#  traveller  :boolean
#  treasure   :boolean
#  updated_at :datetime         not null
#  victory    :boolean
#  zombie     :boolean
#

class Card < ApplicationRecord
  has_many :kingdom_memberships, dependent: :destroy
  has_many :kingdoms, through: :kingdom_memberships

  validates :name, uniqueness: true

  def image_path
    "/card-images/#{name.tr(" ", "_")}.jpg"
  end
end
