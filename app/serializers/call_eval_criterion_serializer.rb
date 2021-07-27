class CallEvalCriterionSerializer < ActiveModel::Serializer
  attributes :id, :call_id, :eval_criterion_id, :eval_criterion_name,
             :cec_percentage, :active, :created_by, :updated_by,
             :created_at, :updated_at

  def eval_criterion_name
    eval_criterion = self.object.eval_criterion
    if eval_criterion
      eval_criterion.st_name
    end
  end
end
