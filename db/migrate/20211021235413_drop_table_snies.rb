class DropTableSnies < ActiveRecord::Migration[5.2]
  def change
    remove_reference :research_groups, :snies, foreign_key: true

    drop_join_table :snies, :form_d_act_plans do |t|
      # t.index [:snies_id, :form_d_act_plan_id]
      # t.index [:form_d_act_plan_id, :snies_id]
    end

    drop_join_table :snies, :research_networks do |t|
      # t.index [:snies_id, :research_network_id]
      # t.index [:research_network_id, :snies_id]
    end

    drop_table :snies
  end
end
