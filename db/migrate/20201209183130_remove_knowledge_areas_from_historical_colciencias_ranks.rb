class RemoveKnowledgeAreasFromHistoricalColcienciasRanks < ActiveRecord::Migration[5.2]
  def change
    remove_column :historical_colciencias_ranks, :knowledge_area, :string
    remove_column :historical_colciencias_ranks, :knowledge_subarea, :string
  end
end
