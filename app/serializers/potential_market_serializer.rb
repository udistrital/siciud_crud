class PotentialMarketSerializer < ActiveModel::Serializer
  attributes :id, :segment_ids, :market_participation_id, :necesary_time, :product_dependency, 
  :product_dependency_name, :institution_participation, :institution_participation_name, :stakeholder, 
  :success_rank_id, :market_place, :geo_country_ids, :created_by, :updated_by, :active,
  :procedure_request_id, :created_at, :updated_at

end
