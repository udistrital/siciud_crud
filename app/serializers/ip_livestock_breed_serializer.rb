class IpLivestockBreedSerializer < ActiveModel::Serializer
  attributes :id, :name, :publication_date, :consecutive_number_ma, :observation
  has_one :category
  has_one :research_group
end
