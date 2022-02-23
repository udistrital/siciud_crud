class AddClassificationTypeToFormEActPlans < ActiveRecord::Migration[5.2]
  def change
    add_column :form_e_act_plans, :classification_id, :bigint
    add_index :form_e_act_plans, :classification_id
    add_foreign_key :form_e_act_plans, :subtypes, column: :classification_id, primary_key: :id
  end
end
