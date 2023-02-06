class AnonymousEvaluatorCriterionSerializer < ActiveModel::Serializer
  attributes :id, :code, :total, :criteria,
             :active, :created_by, :updated_by, :created_at, :updated_at


  def total
    self.object.total.to_f
  end

  def criteria
    self.object.proposal_evaluations
  end
end
