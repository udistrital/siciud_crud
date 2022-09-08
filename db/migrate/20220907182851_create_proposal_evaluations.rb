class CreateProposalEvaluations < ActiveRecord::Migration[5.2]
  def change
    create_table :proposal_evaluations do |t|
      t.references :proposal, foreign_key: true
      t.references :call_eval_criterion, foreign_key: true
      t.references :anonymous_evaluator, foreign_key: true
      t.integer :value
      t.boolean :active, default: true
      t.bigint :created_by
      t.bigint :updated_by

      t.timestamps
    end

    add_index :proposal_evaluations, :created_by
    add_foreign_key :proposal_evaluations, :users, column: :created_by, primary_key: :id

    add_index :proposal_evaluations, :updated_by
    add_foreign_key :proposal_evaluations, :users, column: :updated_by, primary_key: :id
  end
end
