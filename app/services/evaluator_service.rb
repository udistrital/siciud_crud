class EvaluatorService
  def self.new_evaluation(proposal, params)
    begin
      criteria = proposal.call.call_eval_criteria
      created_by = params[:proposal_evaluation][:created_by]
      proposal_id = proposal.id
      evaluator = self.new_evaluator(proposal_id, created_by)

      criteria.each do |criterion|
        ProposalEvaluation.create!(
          proposal_id: proposal_id,
          call_eval_criterion_id: criterion.id,
          anonymous_evaluator_id: evaluator.id,
          value: 0,
          created_by: created_by
        )
      end
      return {
        "anonymous_evaluator": evaluator
      }, :created
    rescue ActiveRecord::RecordInvalid => e
      return { error: e.message }, :unprocessable_entity
    end
  end

  def self.new_evaluator(proposal_id, created_by)
    evaluator_proposal_count = ProposalEvaluation.where(
      "proposal_id = ? AND active = true", proposal_id).select(
      "anonymous_evaluator_id").distinct(:anonymous_evaluator_id).count
    new_code = "Anónimo #{evaluator_proposal_count + 1}"
    evaluator = AnonymousEvaluator.create!(code: new_code, created_by: created_by)
    return evaluator
  end

  def self.update_criteria(criteria, updated_by)
    puts criteria
    criteria.each do |criterion|
      proposal_evaluation = ProposalEvaluation.find(criterion[:id])
      params = {
        :value => criterion[:value],
        :active => criterion[:active],
        :updated_by => updated_by
      }
      proposal_evaluation.update(params)
    end
  end
end
