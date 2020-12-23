class CategorySerializer < AbstractProductNewKnwGenSerializer
  attributes :id, :name, :product_type_id, :product_type_name,
             :product_typology_id, :product_typology_name


  def product_type_name
    product_type = self.object.product_type
    if product_type
      product_type.name
    end
  end

  def product_typology_id
    product_type = self.object.product_type
    if product_type
      product_typology = product_type.product_typology
      if product_typology
        product_typology.id
      end
    end
  end

  def product_typology_name
    product_type = self.object.product_type
    if product_type
      product_typology = product_type.product_typology
      if product_typology
        product_typology.name
      end
    end
  end
end
