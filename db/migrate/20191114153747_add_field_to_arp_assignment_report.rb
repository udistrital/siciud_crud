class AddFieldToArpAssignmentReport < ActiveRecord::Migration[5.2]
  def change
    add_column :arp_assignment_reports, :name, :string
  end
end
