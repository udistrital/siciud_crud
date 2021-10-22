class AbstractActionPlanController < ApplicationController

  def set_action_plan_to_form
    @action_plan = ActionPlan.find(params[:action_plan_id])
  end
end