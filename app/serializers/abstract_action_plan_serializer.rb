class AbstractActionPlanSerializer < ActiveModel::Serializer
  def goal_state_name
    goal_state = self.object.goal_state
    if goal_state
      goal_state.st_name
    end
  end

  def plan_type_name
    plan_type = self.object.plan_type
    if plan_type
      plan_type.st_name
    end
  end

  def product_type_name
    product_type = self.object.product_type
    if product_type
      product_type.st_name
    end
  end
end