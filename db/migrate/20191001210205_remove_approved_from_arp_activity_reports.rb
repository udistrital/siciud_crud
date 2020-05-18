class RemoveApprovedFromArpActivityReports < ActiveRecord::Migration[5.2]
  def change
    remove_column :arp_activity_reports, :approved, :bool
  end
end
