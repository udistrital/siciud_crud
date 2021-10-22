class CreateBudgets < ActiveRecord::Migration[5.2]
  def change
    create_table :budgets do |t|
      t.string :description
      t.string :ally_name
      t.date :used_date
      t.bigint :budget_type_id
      t.bigint :amount
      t.references :task, foreign_key: true
      t.bigint :created_by
      t.bigint :updated_by
      t.boolean :active, default: true

      t.timestamps
    end
    add_index :budgets, :budget_type_id
    add_foreign_key :budgets, :subtypes, column: :budget_type_id, primary_key: :id

    add_index :budgets, :created_by
    add_foreign_key :budgets, :users, column: :created_by, primary_key: :id

    add_index :budgets, :updated_by
    add_foreign_key :budgets, :users, column: :updated_by, primary_key: :id
  end
end
