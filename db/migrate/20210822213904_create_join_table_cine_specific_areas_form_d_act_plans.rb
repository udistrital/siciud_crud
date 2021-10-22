class CreateJoinTableCineSpecificAreasFormDActPlans < ActiveRecord::Migration[5.2]
  def change
    create_join_table :cine_specific_areas, :form_d_act_plans do |t|
      # t.index [:cine_specific_area_id, :form_d_act_plan_id]
      # t.index [:form_d_act_plan_id, :cine_specific_area_id]
    end
  end
end
