class FormAActPlanSerializer < AbstractActionPlanSerializer
  attributes :id, :action_plan_id, :product_type_id, :product_type_name,
             :goal, :advanced_total, :order, :plan_type_id, :plan_type_name,
             :indicator_id, :indicator_description, :indicator_product_type_id,
             :indicator_product_type_name,
             :active, :created_by, :updated_by, :created_at, :updated_at

  def indicator_description
    indicator = self.object.indicator
    if indicator
      indicator.ind_description
    end
  end

  def indicator_product_type_id
    indicator = self.object.indicator
    if indicator
      indicator.product_type_id
    end
  end

  def indicator_product_type_name
    indicator = self.object.indicator
    if indicator
      product_type = indicator.product_type
      if product_type
        product_type.st_name
      end
    end
  end
end
