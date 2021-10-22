class DropKnwlPlans < ActiveRecord::Migration[5.2]
  def change
    drop_table :knwl_plans
  end
end
