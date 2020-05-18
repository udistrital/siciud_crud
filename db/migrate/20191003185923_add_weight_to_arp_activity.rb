class AddWeightToArpActivity < ActiveRecord::Migration[5.2]
  def change
    add_column :arp_activities, :weight, :integer
  end
end
