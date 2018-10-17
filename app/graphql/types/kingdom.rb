module Types
  class Kingdom < BaseType
    description "A set of 10 cards that are used for the supply in a game of Dominion"

    field :name, String, null: true
    field :card_ids, [Integer], null: false
    field :cards, [Card], null: false
    field :plays, [Play], null: false
    field :play_count, Integer, null: false
    field :rating, Integer, null: false
  end
end
