class ArpSpecificGoalSerializer < ActiveModel::Serializer
  attributes :id,:goal,:arp_general_goal_id,:weight,:completedPercentage,:assignedWeight,:remaingWeight

  def assignedWeight
    self.object.arp_activities.sum(:weight)
  end

  def remaingWeight
    100 - self.object.arp_activities.sum(:weight)
  end
end
