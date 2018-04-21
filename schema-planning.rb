# name string
class Card
  has_many :kingdom_memberships
  has_many :kingdoms, through: :kingdom_memberships
end

class KingdomMembership
  belongs_to :card
  belongs_to :kingdom
end

# name string
# description text
class Kingdom
  has_many :kingdom_memberships
  has_many :cards, through: :kingdom_memberships
  has_many :ratings
end

# value integer
# kingdom_id integer
class Rating
  belongs_to :rating
end
