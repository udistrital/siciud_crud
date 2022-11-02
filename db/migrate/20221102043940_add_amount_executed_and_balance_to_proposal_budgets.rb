class AddAmountExecutedAndBalanceToProposalBudgets < ActiveRecord::Migration[5.2]
  def change
    add_column :proposal_budgets, :amount_executed, :float
    add_column :proposal_budgets, :balance, :float
  end
end
