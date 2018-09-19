class Types::QueryType < GraphQL::Schema::Object
  # Add root-level fields here.
  # They will be entry points for queries on your schema.

  field :card, Types::CardType, null: false do
    description "A Dominion card"
    argument :id, Integer, required: true
  end

  def card(id:)
    Card.find(id)
  end
end
