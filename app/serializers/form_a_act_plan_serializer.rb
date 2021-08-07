class FormAActPlanSerializer < AbstractActionPlanSerializer
  attributes :id, :action_plan_id, :product_type_id, :product_type_name,
             :goal, :advanced_total, :order, :plan_type_id, :plan_type_name,
             :indicator_id, :indicator_description, :indicator_subtype_id,
             :indicator_subtype_name,
             :active, :created_by, :updated_by, :created_at, :updated_at

  def indicator_description
    indicator = self.object.indicator
    if indicator
      indicator.ind_description
    end
  end

  def indicator_subtype_id
    indicator = self.object.indicator
    if indicator
      indicator.subtype_id
    end
  end

  def indicator_subtype_name
    indicator = self.object.indicator
    if indicator
      subtype = indicator.subtype
      if subtype
        subtype.st_name
      end
    end
  end
end
