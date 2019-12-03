class PokemonController < ApplicationController
    def index
        @pokemon = Pokemon.all.sort_by { |poke| poke.pokedex_entry }
        #@pokemon = Pokemon.getAll
        render json: @pokemon
    end
end
