class CreateActivityEvaluations < ActiveRecord::Migration[5.2]
  def change
    create_table :activity_evaluations do |t|
      t.references :activity_schedule, foreign_key: true
      t.boolean :notified_due_to_expire
      t.boolean :notified_expired
      t.bigint :state_id
      t.boolean :active, default: true
      t.bigint :created_by
      t.bigint :updated_by

      t.timestamps
    end

    add_index :activity_evaluations, :state_id
    add_foreign_key :activity_evaluations, :subtypes, column: :state_id, primary_key: :id

    add_index :activity_evaluations, :created_by
    add_foreign_key :activity_evaluations, :users, column: :created_by, primary_key: :id

    add_index :activity_evaluations, :updated_by
    add_foreign_key :activity_evaluations, :users, column: :updated_by, primary_key: :id
  end
end
