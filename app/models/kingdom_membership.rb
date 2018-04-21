# == Schema Information
#
# Table name: kingdom_memberships
#
#  card_id    :integer
#  created_at :datetime         not null
#  id         :integer          not null, primary key
#  kingdom_id :integer
#  updated_at :datetime         not null
#

class KingdomMembership < ApplicationRecord
  belongs_to :card
  belongs_to :kingdom
end
