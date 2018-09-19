module Types
  class QueryType < GraphQL::Schema::Object
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :card, CardType, null: false do
      description "A Dominion card"
      argument :id, Integer, required: true
    end

    field :kingdom, KingdomType, null: false do
      description "A Dominion kingdom"
      argument :id, Integer, required: true
    end

    def card(id:)
      Card.find(id)
    end

    def kingdom(id:)
      Kingdom.find(id)
    end
  end
end
