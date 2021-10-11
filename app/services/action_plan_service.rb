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
      body_params.key? :is_draft) or (action_plan.active != body_params[:active] and
      body_params.key? :active)
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

  def self.form_is_upgradeable(action_plan, form, body_ap, body_mr, except_list, complement = ".")
    if action_plan.is_draft
      result = {
        is_upgradeable: true,
        body_params: body_ap,
        msg: ""
      }
    elsif form.active != body_ap[:active] and
      body_ap.key? :active
      result = {
        is_upgradeable: true,
        body_params: body_ap.except(*except_list),
        msg: "Only the [#{body_ap.keys.join(", ")}] fields were updated."
      }
    elsif action_plan.is_draft == false and action_plan.management_report_is_draft
      result = {
        is_upgradeable: true,
        body_params: body_mr,
        msg: ""
      }
    elsif record_unchanged(form, body_ap)
      result = {
        is_upgradeable: true,
        body_params: body_ap,
        msg: "Record unchanged. Form#{complement}"
      }
    elsif action_plan.is_draft == false and action_plan.management_report_is_draft == false
      result = {
        is_upgradeable: false,
        body_params: nil,
        msg: "the action plan and the management report cannot be edited because they are not drafts#{complement}"
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
    aux_record = record.as_json.except(*exc)
    aux_body_params = body_params.as_json.except(*exc)
    if aux_body_params.length == 0
      return false
    end
    unless aux_record.length == aux_body_params.length
      common_keys = aux_body_params.keep_if { |k, v| aux_record.key? k}.keys
      aux_record = aux_record.except(*(aux_record.keys - common_keys))
      aux_body_params = aux_body_params.except(*(aux_body_params.keys - common_keys))
    end
    aux_record == aux_body_params
  end
end
