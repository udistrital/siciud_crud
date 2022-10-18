class AddStateToFormEActPlans < ActiveRecord::Migration[5.2]
  def change
    add_column :form_e_act_plans, :state_id, :bigint
    add_index :form_e_act_plans, :state_id
    add_foreign_key :form_e_act_plans, :subtypes, column: :state_id, primary_key: :id
  end
end
