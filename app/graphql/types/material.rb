module Types
  class Material < BaseType
    description "A component of the Dominion game that is not a card (such as mats, tokens, etc)"

    field :name, String, null: false
    field :mat, Boolean, null: false
    field :token, Boolean, null: false
    field :image_name, String, null: true
  end
end
