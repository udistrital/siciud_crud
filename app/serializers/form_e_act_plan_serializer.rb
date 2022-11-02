class FormEActPlanSerializer < AbstractActionPlanSerializer
  attributes :id, :action_plan_id, :type_description, :classification_id,
             :classification_name, :description, :value, :state_id, :state_name,
             :inventoried, :inventory_plate, :plan_type_id, :plan_type_name,
             :proposal_id, :active, :created_by, :updated_by, :created_at, :updated_at

  def classification_name
    classification = self.object.classification
    if classification
      classification.st_name
    end
  end

  def state_name
    state = self.object.state
    if state
      state.st_name
    end
  end

  def proposal_id
    inv_hists = self.object.inventory_histories
    unless inv_hists.blank?
      inv_hist = inv_hists.last
      inv_hist.id
    end
  end
end
