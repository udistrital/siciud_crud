class CreateActionPlanPrintViews < ActiveRecord::Migration[5.2]
  def change
    create_view :action_plan_print_views
  end
end
