class CreateCompleteCallEvalCriteria < ActiveRecord::Migration[5.2]
  def change
    create_view :complete_call_eval_criteria
  end
end
