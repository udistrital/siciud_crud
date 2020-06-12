class ProductTypeSerializer < ActiveModel::Serializer
  attributes :id, :name, :typology, :indicator

  def typology
    self.object.product_typology.name do |prod_typology|
      prod_typology
    end
  end
end
