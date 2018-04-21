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
  has_many :kingdom_memberships, dependent: :nullify
  has_many :kingdoms, through: :kingdom_memberships
end
