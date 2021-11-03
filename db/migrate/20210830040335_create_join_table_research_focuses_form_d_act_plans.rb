class CreateJoinTableResearchFocusesFormDActPlans < ActiveRecord::Migration[5.2]
  def change
    create_join_table :subtypes, :form_d_act_plans, table_name: :research_focuses_form_d_plans do |t|
      # t.index [:subtype_id, :form_d_act_plan_id]
      # t.index [:form_d_act_plan_id, :subtype_id]
    end
  end
end
