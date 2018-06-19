# == Schema Information
#
# Table name: plays
#
#  created_at        :datetime         not null
#  id                :integer          not null, primary key
#  kingdom_id        :integer
#  number_of_players :integer
#  rating            :integer
#  updated_at        :datetime         not null
#

class Play < ApplicationRecord
  belongs_to :kingdom

  validates :rating, presence: true, inclusion: { in: 1..5 }
  validates :number_of_players, presence: true, inclusion: { in: 2..6 }
end
