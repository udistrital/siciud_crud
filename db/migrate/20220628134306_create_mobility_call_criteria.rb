class CreateMobilityCallCriteria < ActiveRecord::Migration[5.2]
  def change
    create_table :mobility_call_criteria do |t|
      t.references :mobility_call, foreign_key: true
      t.references :call_eval_criterion, foreign_key: true
      t.integer :value, limit: 2
      t.boolean :active, default: true
      t.bigint :created_by
      t.bigint :updated_by

      t.timestamps
    end

    add_index :mobility_call_criteria, :created_by
    add_foreign_key :mobility_call_criteria, :users, column: :created_by, primary_key: :id

    add_index :mobility_call_criteria, :updated_by
    add_foreign_key :mobility_call_criteria, :users, column: :updated_by, primary_key: :id
  end
end
