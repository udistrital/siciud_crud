class CreateJoinTableEvaluatorsProposals < ActiveRecord::Migration[5.2]
  def change
    create_join_table :evaluators, :proposals do |t|
      # t.index [:evaluator_id, :proposal_id]
      # t.index [:proposal_id, :evaluator_id]
    end
  end
end
