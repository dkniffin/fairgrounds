class KingdomSerializer < ApplicationSerializer
  attributes :id, :name, :rating, :play_count

  has_many :cards

  def play_count
    object.plays.count
  end
end
