class AddValueToFormEActPlans < ActiveRecord::Migration[5.2]
  def change
    add_column :form_e_act_plans, :value, :float
  end
end
