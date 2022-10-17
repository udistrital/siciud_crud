class FormEActPlanSerializer < AbstractActionPlanSerializer
  attributes :id, :action_plan_id, :type_description, :classification_id,
             :classification_name, :description, :value,
             :inventoried, :inventory_plate, :plan_type_id, :plan_type_name,
             :active, :created_by, :updated_by, :created_at, :updated_at

  def classification_name
    classification = self.object.classification
    if classification
      classification.st_name
    end
  end
end
