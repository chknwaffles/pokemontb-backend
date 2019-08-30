class PokemonSerializer < ActiveModel::Serializer
  # has_many :abilities
  attributes :id, :pokedex_entry, :name, :height, :weight, :types, :stats, :sprites
end
