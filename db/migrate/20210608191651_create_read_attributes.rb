class CreateReadAttributes < ActiveRecord::Migration[5.2]
  def change
    create_table :read_attributes do |t|
      t.references :task_attribute, foreign_key: true
      t.references :task_model, foreign_key: true
      t.bigint :created_by
      t.bigint :updated_by

      t.timestamps
    end
    add_index :read_attributes, :created_by
    add_foreign_key :read_attributes, :users, column: :created_by, primary_key: :id
    add_index :read_attributes, :updated_by
    add_foreign_key :read_attributes, :users, column: :updated_by, primary_key: :id
  end
end
