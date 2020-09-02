class AddKnowledgeAreaAndKnowledgeSubareaToHistoricalColcienciasRanks < ActiveRecord::Migration[5.2]
  def change
    add_column :historical_colciencias_ranks, :knowledge_area, :string
    add_column :historical_colciencias_ranks, :knowledge_subarea, :string
  end
end
