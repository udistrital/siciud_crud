class CreateProposalBudgets < ActiveRecord::Migration[5.2]
  def change
    create_table :proposal_budgets do |t|
      t.references :call_item, foreign_key: true
      t.float :amount_request_cidc
      t.float :counterparty
      t.float :amount_in_kind
      t.float :subtotal
      t.references :proposal, foreign_key: true
      t.boolean :active, default: true
      t.bigint :created_by
      t.bigint :updated_by

      t.timestamps
    end

    add_index :proposal_budgets, :created_by
    add_foreign_key :proposal_budgets, :users, column: :created_by, primary_key: :id

    add_index :proposal_budgets, :updated_by
    add_foreign_key :proposal_budgets, :users, column: :updated_by, primary_key: :id
  end
end
