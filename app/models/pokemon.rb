class Pokemon < ApplicationRecord
    has_many :abilities
    
    def self.getAll
        for i in 1..151 do
            poke_hash = PokeApi.get(pokemon: i)
            new_poke = Pokemon.find_or_create_by(pokedex_entry: poke_hash.id, name: poke_hash.name, height: poke_hash.height, weight: poke_hash.weight)

            new_types = poke_hash.types.map do |type_e|
                result = Hash.new
                result[type_e.type.name] = type_e.slot
                Oj.dump(result)
            end

            new_stats = poke_hash.stats.map do |stat_e| 
                result = Hash.new
                result[stat_e.stat.name] = stat_e.base_stat
                Oj.dump(result)
            end

            new_sprites = [poke_hash.sprites.front_default, poke_hash.sprites.back_default, poke_hash.sprites.front_shiny, poke_hash.sprites.back_shiny]
            #poke_hash.moves.map { |move_e| { name: move_e.move.name, learned_at: , type: }}
            moveset = []
            poke_hash.moves.map do |move_e|
                move_e.version_group_details.map do |version_e|
                    if version_e.version_group.name == "red-blue"
                        result = Hash.new
                        result[move_e.move.name] = version_e.level_learned_at
                        moveset.push(Oj.dump(result))
                    end
                end
            end

            new_poke.update(types: new_types, stats: new_stats, sprites: new_sprites, moveset: moveset)
            new_poke.save
        end

        Pokemon.all.sort_by { |pokemon| pokemon.pokedex_entry }
    end
end
