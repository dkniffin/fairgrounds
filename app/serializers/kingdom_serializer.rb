class KingdomSerializer < ApplicationSerializer
  attributes :id, :name, :rating, :play_count, :errors

  has_many :cards
  has_many :supply_cards
  has_many :non_supply_cards
  has_many :materials
end
