# == Schema Information
#
# Table name: ratings
#
#  created_at :datetime         not null
#  id         :integer          not null, primary key
#  kingdom_id :integer
#  updated_at :datetime         not null
#  value      :integer
#

class Rating < ApplicationRecord
  belongs_to :kingdom
end
