class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  delegate :to_json, :as_json, to: :serializer

  private

  def serializer
    ActiveModelSerializers::SerializableResource.new(self)
  end
end
