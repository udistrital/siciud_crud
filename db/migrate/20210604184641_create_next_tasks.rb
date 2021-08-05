class CreateNextTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :next_tasks do |t|
      t.references :actual_task, index: true
      t.references :following_task, index: true
      t.bigint :created_by
      t.bigint :updated_by

      t.timestamps
    end
    add_index :next_tasks, :created_by
    add_foreign_key :next_tasks, :users, column: :created_by, primary_key: :id
    add_index :next_tasks, :updated_by
    add_foreign_key :next_tasks, :users, column: :updated_by, primary_key: :id

    add_foreign_key :next_tasks, :task_models, column: :actual_task_id
    add_foreign_key :next_tasks, :task_models, column: :following_task_id
  end
end
