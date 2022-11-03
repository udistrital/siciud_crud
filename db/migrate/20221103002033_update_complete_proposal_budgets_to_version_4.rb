class UpdateCompleteProposalBudgetsToVersion4 < ActiveRecord::Migration[5.2]
  def change
    update_view :complete_proposal_budgets, version: 4, revert_to_version: 3
  end
end
