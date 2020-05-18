class AddStatusToArpActivityReports < ActiveRecord::Migration[5.2]
  def change
    add_column :arp_activity_reports, :status, :integer
  end
end
