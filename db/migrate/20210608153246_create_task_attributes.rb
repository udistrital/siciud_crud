class CreateTaskAttributes < ActiveRecord::Migration[5.2]
  def change
    create_table :task_attributes do |t|
      t.references :attribute_sub_type, index: true
      t.references :task_model, foreign_key: true
      t.bigint :created_by
      t.bigint :updated_by

      t.timestamps
    end
    add_index :task_attributes, :created_by
    add_foreign_key :task_attributes, :users, column: :created_by, primary_key: :id
    add_index :task_attributes, :updated_by
    add_foreign_key :task_attributes, :users, column: :updated_by, primary_key: :id

    add_foreign_key :task_attributes, :subtypes, column: :attribute_sub_type_id
  end
end
