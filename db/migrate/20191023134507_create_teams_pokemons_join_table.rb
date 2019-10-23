class CreateTeamsPokemonsJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table :pokemons, :teams do |t|
      t.index :pokemon_id
      t.index :team_id
    end
  end
end
