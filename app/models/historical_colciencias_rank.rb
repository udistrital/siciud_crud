class HistoricalColcienciasRank < ApplicationRecord
  belongs_to :colciencias_call
  belongs_to :colciencias_category
  belongs_to :research_group
  belongs_to :oecd_knowledge_area, optional: true
  belongs_to :oecd_knowledge_subarea, optional: true
end
