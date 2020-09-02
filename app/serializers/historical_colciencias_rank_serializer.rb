class HistoricalColcienciasRankSerializer < ActiveModel::Serializer
  attributes :id, :colciencias_call_id, :year_call, :colciencias_category_id,
             :research_group_id, :knowledge_area, :knowledge_subarea

  def year_call
    self.object.colciencias_call.year
  end
end
