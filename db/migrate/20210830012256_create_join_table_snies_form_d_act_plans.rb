class CreateJoinTableSniesFormDActPlans < ActiveRecord::Migration[5.2]
  def change
    create_join_table :snies, :form_d_act_plans do |t|
      # t.index [:snies_id, :form_d_act_plan_id]
      # t.index [:form_d_act_plan_id, :snies_id]
    end
  end
end
