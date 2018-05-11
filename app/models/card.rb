# == Schema Information
#
# Table name: cards
#
#  created_at :datetime         not null
#  id         :integer          not null, primary key
#  name       :string
#  updated_at :datetime         not null
#

class Card < ApplicationRecord
  has_many :kingdom_memberships, dependent: :destroy
  has_many :kingdoms, through: :kingdom_memberships

  validates :name, uniqueness: true

  def image_path
    "/card-images/#{name.tr(" ", "_")}.jpg"
  end
end
