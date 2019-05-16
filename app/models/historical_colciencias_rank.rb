class HistoricalColcienciasRank < ApplicationRecord
  belongs_to :colciencias_call
  belongs_to :colciencias_category
  belongs_to :research_group
end
