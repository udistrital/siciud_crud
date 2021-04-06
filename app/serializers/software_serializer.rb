class SoftwareSerializer < ActiveModel::Serializer
  attributes :id, :sof_registration_number, :sof_product_title, :sof_date_of_obtaining, :sof_description, :category_id, :observation, :active, :created_by, :updated_by
  has_one :geo_country
  has_one :research_group
  has_one :colciencias_call
end
