class CreateColcienciasCalls < ActiveRecord::Migration[5.2]
  def change
    create_table :colciencias_calls do |t|
      t.string :name
      t.integer :year

      t.timestamps
    end
  end
end
