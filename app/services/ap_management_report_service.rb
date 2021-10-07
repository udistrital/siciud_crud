class ApManagementReportService
  def self.is_publishable(action_plan, body_params)
    not action_plan.is_draft and
      body_params.key? :management_report_is_draft and
      action_plan.management_report_is_draft != body_params[:management_report_is_draft] and
      body_params[:management_report_is_draft] == false
  end

  def self.is_upgradeable(action_plan, body_params)
    if action_plan.is_draft
      result = {
        is_upgradeable: false,
        msg: "The action plan management report cannot be edited because the action plan is a draft."
      }
      return result
    end
    if action_plan.management_report_is_draft or body_params[:management_report_is_draft]
      result = {
        is_upgradeable: true,
        msg: ""
      }
      return result
    elsif action_plan.management_report_is_draft != body_params[:management_report_is_draft] and
      body_params.key? :management_report_is_draft
      result = {
        is_upgradeable: true,
        msg: "Only the [#{body_params.keys.join(", ")}] fields were updated."
      }
      return result
    else
      result = {
        is_upgradeable: false,
        msg: "The action plan management report cannot be edited because it is not a draft."
      }
      return result
    end
  end

  def self.form_is_upgradeable(action_plan, form, body_params, except_list, complement = ".")
    if action_plan.is_draft
      result = {
        is_upgradeable: true,
        body_params: body_params,
        msg: ""
      }
    elsif form.active != body_params[:active] and
      body_params.key? :active
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
end
