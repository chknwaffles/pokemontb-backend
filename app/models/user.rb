class User < ApplicationRecord
    has_and_belongs_to_many :pokemons

    validates :email, uniqueness: true
    has_secure_password
end
