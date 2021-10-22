class CreateTaskHasStates < ActiveRecord::Migration[5.2]
  def change
    create_table :task_has_states do |t|
      t.references :task, foreign_key: true
      t.bigint :state_id
      t.bigint :created_by
      t.bigint :updated_by
      t.boolean :active, default: true

      t.timestamps
    end

    add_index :task_has_states, :state_id
    add_foreign_key :task_has_states, :subtypes, column: :state_id, primary_key: :id

    add_index :task_has_states, :created_by
    add_foreign_key :task_has_states, :users, column: :created_by, primary_key: :id

    add_index :task_has_states, :updated_by
    add_foreign_key :task_has_states, :users, column: :updated_by, primary_key: :id
  end
end
