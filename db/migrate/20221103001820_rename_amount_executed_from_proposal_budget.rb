class RenameAmountExecutedFromProposalBudget < ActiveRecord::Migration[5.2]
  def change
    rename_column :proposal_budgets, :amount_executed, :executed_amount
  end
end
