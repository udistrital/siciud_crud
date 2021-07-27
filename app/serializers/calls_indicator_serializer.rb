class CallsIndicatorSerializer < ActiveModel::Serializer
  attributes :id, :call_id, :indicator_id, :indicator_name,
             :clind_required, :clind_quantity, :product_type_id, :product_type_name,
             :active, :created_by, :updated_by, :created_at, :updated_at

  def indicator_name
    indicator = self.object.indicator
    if indicator
      indicator.ind_description
    end
  end

  def product_type_id
    indicator = self.object.indicator
    if indicator
      prod_type = indicator.product_type
      if prod_type
        prod_type.id
      end
    end
  end

  def product_type_name
    indicator = self.object.indicator
    if indicator
      prod_type = indicator.product_type
      if prod_type
        prod_type.st_name
      end
    end
  end
end
