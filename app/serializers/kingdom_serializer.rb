class KingdomSerializer < ApplicationSerializer
  attributes :id, :name, :rating, :play_count, :errors

  has_many :cards
end
