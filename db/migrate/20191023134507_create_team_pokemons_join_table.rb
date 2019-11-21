class CreateTeamPokemonsJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table :teams, :pokemons do |t|
      t.index :team_id
      t.index :pokemon_id
    end
  end
end
