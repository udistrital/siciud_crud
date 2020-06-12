class CallsProductTypeSerializer < ActiveModel::Serializer
  attributes :id, :product_type_id, :required, :quantity, :alternate_indicator
end
