class CreateJoinTableOecdKnowledgeSubareasFormDActPlans < ActiveRecord::Migration[5.2]
  def change
    create_join_table :oecd_knowledge_subareas, :form_d_act_plans do |t|
      # t.index [:oecd_knowledge_subarea_id, :form_d_act_plan_id]
      # t.index [:form_d_act_plan_id, :oecd_knowledge_subarea_id]
    end
  end
end
