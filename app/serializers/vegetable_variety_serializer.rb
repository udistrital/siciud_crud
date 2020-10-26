class VegetableVarietySerializer < ActiveModel::Serializer
  attributes :id, :name, :date, :observation
  has_one :cycle_type
  has_one :petition_status
  has_one :category
  has_one :research_group
end
