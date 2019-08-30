class AbilitySerializer < ActiveModel::Serializer
  has_many :pokemon
  attributes :id, :name
end
