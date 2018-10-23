module Types
  class Query < GraphQL::Schema::Object
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :cards, [Types::Card], null: false

    def cards
      ::Card.all
    end

    field :card, Types::Card, null: false do
      argument :id, Integer, required: true
    end

    def card(id:)
      ::Card.find(id)
    end

    field :kingdom, Types::Kingdom, null: false do
      argument :id, Integer, required: true
    end

    def kingdom(id:)
      ::Kingdom.find(id)
    end

    field :play, Types::Play, null: false do
      argument :id, Integer, required: true
    end

    def play(id:)
      ::Play.find(id)
    end

    field :material, Types::Material, null: false do
      argument :id, Integer, required: true
    end

    def material(id:)
      ::Material.find(id)
    end
  end
end
