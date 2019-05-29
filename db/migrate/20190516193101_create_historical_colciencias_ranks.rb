class CreateHistoricalColcienciasRanks < ActiveRecord::Migration[5.2]
  def change
    create_table :historical_colciencias_ranks do |t|
      t.references :colciencias_call, foreign_key: true
      t.references :colciencias_category, foreign_key: true
      t.references :research_group, foreign_key: true

      t.timestamps
    end
  end
end
