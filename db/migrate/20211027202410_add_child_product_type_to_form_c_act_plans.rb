class AddChildProductTypeToFormCActPlans < ActiveRecord::Migration[5.2]
  def change
    add_column :form_c_act_plans, :child_prod_type_id, :bigint
    add_index :form_c_act_plans, :child_prod_type_id
    add_foreign_key :form_c_act_plans, :subtypes, column: :child_prod_type_id, primary_key: :id
  end
end
