class CreateCallEvalCriteria < ActiveRecord::Migration[5.2]
  def change
    create_table :call_eval_criteria do |t|
      t.references :call, foreign_key: true
      t.bigint :eval_criterion_id
      t.decimal :cec_percentage, precision: 5, scale: 2
      t.boolean :active, default: true
      t.bigint :created_by
      t.bigint :updated_by

      t.timestamps
    end

    add_index :call_eval_criteria, :eval_criterion_id
    add_foreign_key :call_eval_criteria, :subtypes, column: :eval_criterion_id, primary_key: :id

    add_index :call_eval_criteria, :created_by
    add_foreign_key :call_eval_criteria, :users, column: :created_by, primary_key: :id

    add_index :call_eval_criteria, :updated_by
    add_foreign_key :call_eval_criteria, :users, column: :updated_by, primary_key: :id
  end
end
