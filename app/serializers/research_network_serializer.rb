class ResearchNetworkSerializer < ActiveModel::Serializer
  attributes :id, :name, :acronym, :request_date, :mission, :vision, :advantage, :main_research_group_id, :network_type_id, :academic_responsibilities, :financial_responsibilities, :legal_responsibilities, :active, :created_by, :updated_by
  has_one :researcher
  has_one :cine_broad_area
  has_one :cine_specific_area
  has_one :oecd_knowledge_subarea
  has_one :oecd_knowledge_area
end
