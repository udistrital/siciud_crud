class CallsProductTypeSerializer < ActiveModel::Serializer
  attributes :id, :product_type_id, :required_type, :quantity, :alternate_indicator

  def required_type
    self.object.required_type_id do |id|
      id
    end
  end
end
