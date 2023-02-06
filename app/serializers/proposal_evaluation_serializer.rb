class ProposalEvaluationSerializer < ActiveModel::Serializer
  attributes :id, :value, :proposal_id,
             :active, :created_by, :updated_by, :created_at, :updated_at
  has_one :call_eval_criterion
  has_one :anonymous_evaluator
end
