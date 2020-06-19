class CallsProductTypeSerializer < ActiveModel::Serializer
  attributes :id, :product_type_id, :product_typology_id, :required_type, :quantity, :alternate_indicator

  def required_type
    self.object.required_type_id do |id|
      id
    end
  end

  def product_typology_id
    self.object.product_type.product_typology_id do |pd|
      pd
    end
  end
end
