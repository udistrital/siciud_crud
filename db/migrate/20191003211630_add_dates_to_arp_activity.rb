class AddDatesToArpActivity < ActiveRecord::Migration[5.2]
  def change
    add_column :arp_activities, :startDate, :date
    add_column :arp_activities, :finishDate, :Date
  end
end
