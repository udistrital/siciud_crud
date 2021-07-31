class ActionPlanService
  def self.is_publishable(action_plan, body_params)
    body_params.key? :is_draft and
      action_plan.is_draft != body_params[:is_draft] and
      body_params[:is_draft] == false
  end

  def self.is_upgradeable(action_plan, body_params, except_list, complement = ".")
    if action_plan.is_draft or body_params[:is_draft]
      result = {
        is_upgradeable: true,
        body_params: body_params,
        msg: ""
      }
    elsif (action_plan.is_draft != body_params[:is_draft] and
      body_params.key? :is_draft) or action_plan.active != body_params[:active]
      body_params = body_params.except(*except_list)
      result = {
        is_upgradeable: true,
        body_params: body_params,
        msg: "Only the [#{body_params.keys.join(", ")}] fields were updated."
      }
    elsif record_unchanged(action_plan, body_params, ["published_at"])
      result = {
        is_upgradeable: true,
        body_params: body_params,
        msg: "Record unchanged. ActionPlan"
      }
    else
      result = {
        is_upgradeable: false,
        body_params: nil,
        msg: "The action plan cannot be edited because it is not a draft#{complement}"
      }
    end
    result
  end

  def self.form_is_upgradeable(action_plan, form, body_params, except_list, complement = ".")
    puts "Sin cambios: #{record_unchanged(form, body_params)}"
    if action_plan.is_draft
      result = {
        is_upgradeable: true,
        body_params: body_params,
        msg: ""
      }
    elsif form.active != body_params[:active]
      result = {
        is_upgradeable: true,
        body_params: body_params.except(*except_list),
        msg: "Only the [#{body_params.keys.join(", ")}] fields were updated."
      }
    elsif record_unchanged(form, body_params)
      result = {
        is_upgradeable: true,
        body_params: body_params,
        msg: "Record unchanged. Form"
      }
    else
      result = {
        is_upgradeable: false,
        body_params: nil,
        msg: "The action plan cannot be edited because it is not a draft#{complement}"
      }
    end
    result
  end

  private

  def self.record_unchanged(record, body_params, fields_to_exclude=[])
    exc = %w[id created_at updated_at created_by updated_by]
    exc += fields_to_exclude
    record.as_json.except(*exc) == body_params.as_json.except(*exc)
  end
end
