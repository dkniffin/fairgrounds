module Types
  class Query < GraphQL::Schema::Object
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    def self.resource(name, type, model)
      plural = name.to_s.pluralize
      list_name = "all_#{plural}".to_sym
      meta_name = "_#{list_name}_meta".to_sym
      single_name = name.capitalize.to_sym

      field list_name, [type], null: false do
        description "All collection of all #{plural}"
      end

      define_method(list_name) do
        model.all
      end

      field meta_name, Types::Meta, null: false do
        description "Metadata about all #{plural}"
      end

      define_method(meta_name) do
        { count: model.count }
      end

      field single_name, type, null: false do
        argument :id, ID, required: true
        description "A single #{name}"
      end

      define_method(name) do |id:|
        model.find(id)
      end
    end

    resource :card, Types::Card, ::Card
    resource :kingdom, Types::Kingdom, ::Kingdom
    resource :play, Types::Play, ::Play
    resource :material, Types::Material, ::Material
  end
end
