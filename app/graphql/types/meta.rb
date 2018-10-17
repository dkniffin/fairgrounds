module Types
  class Meta < BaseType
    description "A collection of metadata about the parent"

    field :count, Integer, null: false
  end
end
