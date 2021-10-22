class CreateFormEActPlans < ActiveRecord::Migration[5.2]
  def change
    create_table :form_e_act_plans do |t|
      t.text :type_description
      t.text :description
      t.boolean :inventoried
      t.string :inventory_plate
      t.references :action_plan, foreign_key: true
      t.bigint :plan_type_id
      t.boolean :active, default: true
      t.bigint :created_by
      t.bigint :updated_by

      t.timestamps
    end

    add_index :form_e_act_plans, :created_by
    add_foreign_key :form_e_act_plans, :users, column: :created_by, primary_key: :id

    add_index :form_e_act_plans, :updated_by
    add_foreign_key :form_e_act_plans, :users, column: :updated_by, primary_key: :id
    
  end
end
