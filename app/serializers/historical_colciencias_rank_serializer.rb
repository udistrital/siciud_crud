class HistoricalColcienciasRankSerializer < ActiveModel::Serializer
  attributes :id, :colciencias_call_id, :year_call, :colciencias_category_id,
             :research_group_id, :oecd_knowledge_area_id, :oecd_knowledge_subarea_id

  def year_call
    self.object.colciencias_call.year
  end
end
