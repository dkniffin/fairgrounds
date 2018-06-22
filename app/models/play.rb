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

  validates :rating, presence: true, numericality: { greater_than: 0, less_than: 6 }
  validates :number_of_players, presence: true, numericality: { greater_than: 1, less_than: 7 }
end
