class CreateCalls < ActiveRecord::Migration[5.2]
  def change
    create_table :calls do |t|
      t.text :call_name
      t.bigint :call_state_id
      t.string :call_code
      t.bigint :call_type_id
      t.bigint :call_beneficiary_id
      t.integer :call_duration
      t.date :call_start_date
      t.date :call_end_date
      t.float :call_global_budget
      t.float :call_max_budget_per_project
      t.text :call_directed_towards
      t.text :call_objective
      t.boolean :active, default: true
      t.bigint :created_by
      t.bigint :updated_by

      t.timestamps
    end

    add_index :calls, :call_state_id
    add_foreign_key :calls, :subtypes, column: :call_state_id, primary_key: :id

    add_index :calls, :call_type_id
    add_foreign_key :calls, :subtypes, column: :call_type_id, primary_key: :id

    add_index :calls, :call_beneficiary_id
    add_foreign_key :calls, :subtypes, column: :call_beneficiary_id, primary_key: :id

    add_index :calls, :created_by
    add_foreign_key :calls, :users, column: :created_by, primary_key: :id

    add_index :calls, :updated_by
    add_foreign_key :calls, :users, column: :updated_by, primary_key: :id
  end
end
