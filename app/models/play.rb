# == Schema Information
#
# Table name: plays
#
#  created_at        :datetime         not null
#  id                :integer          not null, primary key
#  kingdom_id        :integer
#  number_of_players :string
#  rating            :integer
#  updated_at        :datetime         not null
#

class Play < ApplicationRecord
  belongs_to :kingdom
end
