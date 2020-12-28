class AddKnowledgeAreasToHistoricalColcienciasRanks < ActiveRecord::Migration[5.2]
  def change
    add_reference :historical_colciencias_ranks, :oecd_knowledge_area, foreign_key: true
    add_reference :historical_colciencias_ranks, :oecd_knowledge_subarea, foreign_key: true
  end
end
