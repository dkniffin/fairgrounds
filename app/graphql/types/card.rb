module Types
  class Card < BaseType
    description "A Dominion card (including sideways cards)"

    field :name, String, null: true
    field :cost, Integer, null: true
    field :potion_cost, Integer, null: true
    field :special_cost, Boolean, null: true
    field :image_path, String, null: true
    field :image_url, String, null: true

    field :action, Boolean, null: true
    field :attack, Boolean, null: true
    field :boon, Boolean, null: true
    field :castle, Boolean, null: true
    field :curse, Boolean, null: true
    field :doom, Boolean, null: true
    field :duration, Boolean, null: true
    field :event, Boolean, null: true
    field :fate, Boolean, null: true
    field :gathering, Boolean, null: true
    field :heirloom, Boolean, null: true
    field :hex, Boolean, null: true
    field :landmark, Boolean, null: true
    field :looter, Boolean, null: true
    field :night, Boolean, null: true
    field :prize, Boolean, null: true
    field :reaction, Boolean, null: true
    field :reserve, Boolean, null: true
    field :shelter, Boolean, null: true
    field :spirit, Boolean, null: true
    field :state, Boolean, null: true
    field :supply, Boolean, null: true
    field :trash, Boolean, null: true
    field :traveller, Boolean, null: true
    field :treasure, Boolean, null: true
    field :victory, Boolean, null: true
    field :zombie, Boolean, null: true

    field :dependencies, [Types::Dependency], null: false
  end
end
