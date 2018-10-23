module Types
  class Play < BaseType
    description "A game of a Dominion kingdom, logged by users"

    field :number_of_players, Integer, null: false
    field :rating, Integer, null: false
  end
end
