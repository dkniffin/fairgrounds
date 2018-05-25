class KingdomSerializer < ApplicationSerializer
  attributes :id, :name, :rating

  has_many :cards
end
