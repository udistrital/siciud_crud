class AddManagementReportIsDraftToActionPlans < ActiveRecord::Migration[5.2]
  def change
    add_column :action_plans, :management_report_is_draft, :boolean, default: true
    add_column :action_plans, :management_report_published_at, :datetime
  end
end
