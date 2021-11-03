class CreateTaskModels < ActiveRecord::Migration[5.2]
  def change
    create_table :task_models do |t|
      t.string :name
      t.integer :duration
      t.references :professional_role, foreign_key: true
      t.references :procedure, foreign_key: true
      t.bigint :created_by
      t.bigint :updated_by

      t.timestamps
    end
    add_index :task_models, :created_by
    add_foreign_key :task_models, :users, column: :created_by, primary_key: :id
    add_index :task_models, :updated_by
    add_foreign_key :task_models, :users, column: :updated_by, primary_key: :id
  end
end
