class DropKnwlAreaPlanViews < ActiveRecord::Migration[5.2]
  def change
    drop_view :complete_knwl_area_plan_cines
    drop_view :complete_knwl_area_plan_oecds
  end
end
