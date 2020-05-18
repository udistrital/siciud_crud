class RemoveArpSpecificGoalFromArpActivity < ActiveRecord::Migration[5.2]
  def change
    remove_reference :arp_activities, :arp_specific_goal, foreign_key: true
  end
end
