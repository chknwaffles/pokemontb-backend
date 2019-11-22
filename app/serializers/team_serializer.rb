class TeamSerializer < ActiveModel::Serializer
    has_many :pokemons
    attributes :id, :name
  end