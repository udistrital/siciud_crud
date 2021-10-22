class CreateFormCActPlans < ActiveRecord::Migration[5.2]
  def change
    create_table :form_c_act_plans do |t|
      t.bigint :product_type_id
      t.text :description
      t.integer :goal
      t.integer :advanced_total, default: 0
      t.integer :order, limit: 1
      t.references :action_plan, foreign_key: true
      t.bigint :plan_type_id
      t.boolean :active, default: true
      t.bigint :created_by
      t.bigint :updated_by

      t.timestamps
    end

    add_index :form_c_act_plans, :product_type_id
    add_foreign_key :form_c_act_plans, :subtypes, column: :product_type_id, primary_key: :id

    add_index :form_c_act_plans, :plan_type_id
    add_foreign_key :form_c_act_plans, :subtypes, column: :plan_type_id, primary_key: :id

    add_index :form_c_act_plans, :created_by
    add_foreign_key :form_c_act_plans, :users, column: :created_by, primary_key: :id

    add_index :form_c_act_plans, :updated_by
    add_foreign_key :form_c_act_plans, :users, column: :updated_by, primary_key: :id

  end
end
