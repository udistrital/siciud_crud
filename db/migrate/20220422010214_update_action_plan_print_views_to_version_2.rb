class UpdateActionPlanPrintViewsToVersion2 < ActiveRecord::Migration[5.2]
  def change
    update_view :action_plan_print_views, version: 2, revert_to_version: 1
  end
end
