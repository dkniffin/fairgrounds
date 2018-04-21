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
  has_many :kingdom_memberships, dependent: :nullify
  has_many :cards, through: :kingdom_memberships
end
