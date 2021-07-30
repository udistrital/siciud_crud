class IndicatorSerializer < ActiveModel::Serializer
  attributes :id, :product_type_id, :ind_description,
             :active, :created_by, :updated_by, :created_at, :updated_at
end
