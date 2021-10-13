class HistLegalRepresentativeSerializer < ActiveModel::Serializer
  attributes :id, :is_current, :active, :created_by, :updated_by
  has_one :legal_representative
  has_one :entity
end
