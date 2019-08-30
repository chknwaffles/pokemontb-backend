class CreatePokemons < ActiveRecord::Migration[6.0]
  def change
    create_table :pokemons do |t|
      t.integer :pokedex_entry
      t.string :name
      t.integer :height
      t.integer :weight
      t.string :types, array: true, default: []
      t.string :moveset, array: true, default: []
      t.string :stats, array: true, default: []
      t.string :sprites, array: true, default: []
      t.timestamps
    end
  end
end
