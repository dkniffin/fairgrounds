class KingdomSerializer < ApplicationSerializer
  attributes :id, :name

  has_many :cards
end
