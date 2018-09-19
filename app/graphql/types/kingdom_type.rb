module Types
  class KingdomType < GraphQL::Schema::Object
    field :id, Integer, null: false
    field :name, String, null: true
    field :cards, [CardType], null: false
  end
end
