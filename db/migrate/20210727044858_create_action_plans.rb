class CreateActionPlans < ActiveRecord::Migration[5.2]
  def change
    create_table :action_plans do |t|
      t.integer :execution_validity, limit: 2
      t.boolean :is_draft, default: true
      t.references :research_group, foreign_key: true
      t.boolean :active, default: true
      t.bigint :created_by
      t.bigint :updated_by

      t.timestamps
    end

    add_index :action_plans, :created_by
    add_foreign_key :action_plans, :users, column: :created_by, primary_key: :id

    add_index :action_plans, :updated_by
    add_foreign_key :action_plans, :users, column: :updated_by, primary_key: :id

  end
end
