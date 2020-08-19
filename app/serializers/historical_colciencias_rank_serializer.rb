class HistoricalColcienciasRankSerializer < ActiveModel::Serializer
  attributes :id, :colciencias_call_id, :colciencias_category_id, :research_group_id, :year_call

  def year_call
    self.object.colciencias_call.year
  end
end
