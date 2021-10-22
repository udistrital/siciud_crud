class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.references :otri_professional, foreign_key: true
      t.references :task_model, foreign_key: true
      t.bigint :intelectual_property_id
      t.boolean :desition
      t.date :expired_date
      t.references :request_has_procedure, foreign_key: true
      t.bigint :created_by
      t.bigint :updated_by
      t.boolean :active, default: true

      t.timestamps
    end
    add_index :tasks, :intelectual_property_id
    add_foreign_key :tasks, :subtypes, column: :intelectual_property_id, primary_key: :id

    add_index :tasks, :created_by
    add_foreign_key :tasks, :users, column: :created_by, primary_key: :id

    add_index :tasks, :updated_by
    add_foreign_key :tasks, :users, column: :updated_by, primary_key: :id
  end
end
