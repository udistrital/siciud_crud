class AddCompletedPercentageToArpAssignment < ActiveRecord::Migration[5.2]
  def change
    add_column :arp_assignments, :completedPercentage, :int
  end
end
