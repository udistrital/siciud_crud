class AddSniesFromSubtypes < ActiveRecord::Migration[5.2]
  def change
    add_column :research_groups, :snies_id, :bigint
    add_index :research_groups, :snies_id
    add_foreign_key :research_groups, :subtypes, column: :snies_id, primary_key: :id

    add_column :research_networks, :snies_id, :bigint
    add_index :research_networks, :snies_id
    add_foreign_key :research_networks, :subtypes, column: :snies_id, primary_key: :id

    create_join_table :form_d_act_plans, :subtypes, table_name: :form_d_act_plans_snies do |t|
      # t.index [:form_d_act_plan_id, :subtype_id]
      # t.index [:subtype_id, :form_d_act_plan_id]
    end
  end
end
