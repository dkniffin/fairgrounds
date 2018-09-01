# == Schema Information
#
# Table name: card_dependencies
#
#  card_id         :integer
#  created_at      :datetime         not null
#  dependency_id   :integer
#  dependency_type :string
#  id              :integer          not null, primary key
#  updated_at      :datetime         not null
#

class CardDependency < ApplicationRecord
  belongs_to :card
  belongs_to :dependency, polymorphic: true
end
