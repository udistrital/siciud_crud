class PatentSerializer < ActiveModel::Serializer
  attributes :id, :patent_number, :title, :date_of_obtaining, :industrial_publication_gazette, :observation
  has_one :category
  has_one :patent_state
  has_one :research_group
end
