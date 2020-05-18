class RemoveWeightFromArpActivity < ActiveRecord::Migration[5.2]
  def change
    remove_column :arp_activities, :weight, :integer
  end
end
