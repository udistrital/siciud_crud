class ActionPlanService
  def self.is_upgradeable(action_plan, body_params, except_list, complement=".")
    if action_plan.is_draft or body_params[:is_draft]
      puts "********************************************************************************"
      result = {
        is_upgradeable: true,
        body_params: body_params,
        msg: ""
      }
    elsif (action_plan.is_draft != body_params[:is_draft] and
      body_params.key? :is_draft) or action_plan.active != body_params[:active]
      result = {
        is_upgradeable: true,
        body_params: body_params.except(*except_list),
        msg: ""
      }
      puts result
    else
      result = {
        is_upgradeable: false,
        body_params: nil,
        msg: "The action plan cannot be edited because it is not a draft#{complement}"
      }
    end
    result
  end
end
