# == Schema Information
#
# Table name: materials
#
#  created_at :datetime         not null
#  id         :integer          not null, primary key
#  image_name :string
#  mat        :boolean
#  name       :string
#  token      :boolean
#  updated_at :datetime         not null
#

class Material < ApplicationRecord
end
