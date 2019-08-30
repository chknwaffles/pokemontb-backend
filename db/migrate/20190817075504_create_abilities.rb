class CreateAbilities < ActiveRecord::Migration[6.0]
  def change
    create_table :abilities do |t|
      t.boolean :is_hidden
      t.string :name
      t.timestamps
    end
  end
end
