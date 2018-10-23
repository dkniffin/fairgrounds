class Types::Dependency < Types::BaseUnion
  description "Objects should be included in the game, if the dependent card is included"
  possible_types Types::Card, Types::Material

  def self.resolve_type(object, _context)
    if object.is_a?(Material)
      Types::Material
    elsif object.is_a?(Card)
      Types::Card
    end
  end
end
