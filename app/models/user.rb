class User < ApplicationRecord
    has_and_belongs_to_many :pokemons
    has_many :teams
    
    has_secure_password
end
