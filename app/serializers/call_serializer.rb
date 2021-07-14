class CallSerializer < ActiveModel::Serializer
  attributes :id, :call_name, :call_state_id, :call_state_name,
             :call_code, :call_type_id, :call_type_name,
             :call_beneficiary_id, :call_beneficiary_name,
             :call_duration, :call_start_date, :call_end_date,
             :call_global_budget, :call_max_budget_per_project,
             :call_directed_towards, :call_objective,
             :active, :created_by, :updated_by, :created_at, :updated_at

  def call_state_name
    call_state = self.object.call_state
    if call_state
      call_state.st_name
    end
  end

  def call_type_name
    call_type = self.object.call_type
    if call_type
      call_type.st_name
    end
  end

  def call_beneficiary_name
    call_beneficiary = self.object.call_beneficiary
    if call_beneficiary
      call_beneficiary.st_name
    end
  end
end
