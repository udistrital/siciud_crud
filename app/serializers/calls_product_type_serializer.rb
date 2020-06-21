class CallsProductTypeSerializer < ActiveModel::Serializer
  attributes :id, :product_type_id, :product_typology_id, :required_type_id, :quantity, :alternate_indicator

  def product_typology_id
    self.object.product_type.product_typology_id do |pd|
      pd
    end
  end
end
