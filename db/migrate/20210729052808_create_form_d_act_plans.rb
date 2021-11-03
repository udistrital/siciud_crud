class CreateFormDActPlans < ActiveRecord::Migration[5.2]
  def change
    create_table :form_d_act_plans do |t|
      t.text :name
      t.text :description
      t.bigint :goal_state_id
      t.boolean :goal_achieved, default: false 
      t.integer :order, limit: 1
      t.references :action_plan, foreign_key: true
      t.bigint :plan_type_id
      t.boolean :active, default: true
      t.bigint :created_by
      t.bigint :updated_by

      t.timestamps
    end

    add_index :form_d_act_plans, :goal_state_id
    add_foreign_key :form_d_act_plans, :subtypes, column: :goal_state_id, primary_key: :id

    add_index :form_d_act_plans, :plan_type_id
    add_foreign_key :form_d_act_plans, :subtypes, column: :plan_type_id, primary_key: :id

    add_index :form_d_act_plans, :created_by
    add_foreign_key :form_d_act_plans, :users, column: :created_by, primary_key: :id

    add_index :form_d_act_plans, :updated_by
    add_foreign_key :form_d_act_plans, :users, column: :updated_by, primary_key: :id

  end
end
