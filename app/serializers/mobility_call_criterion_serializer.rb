class MobilityCallCriterionSerializer < ActiveModel::Serializer
  attributes :id,
             :mobility_call_id, :call_eval_criterion_id, :eval_criterion_id,
             :eval_criterion_name, :value,
             :active, :created_by, :updated_by, :created_at, :updated_at

  def eval_criterion_id
    call_eval_criterion = self.object.call_eval_criterion
    if call_eval_criterion
      call_eval_criterion.eval_criterion_id
    end
  end

  def eval_criterion_name
    call_eval_criterion = self.object.call_eval_criterion
    if call_eval_criterion
      eval_criterion = call_eval_criterion.eval_criterion
      if eval_criterion
        eval_criterion.st_name
      end
    end
  end

end
