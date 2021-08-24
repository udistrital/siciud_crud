class CreateJoinTableOecdDisciplinesFormDActPlans < ActiveRecord::Migration[5.2]
  def change
    create_join_table :oecd_disciplines, :form_d_act_plans do |t|
      # t.index [:oecd_discipline_id, :form_d_act_plan_id]
      # t.index [:form_d_act_plan_id, :oecd_discipline_id]
    end
  end
end
