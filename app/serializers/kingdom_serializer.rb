class KingdomSerializer < ApplicationSerializer
  attributes :id, :name, :rating, :play_count, :errors

  has_many :cards

  def play_count
    object.plays.count
  end
end
