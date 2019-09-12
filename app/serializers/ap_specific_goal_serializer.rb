class ApSpecificGoalSerializer < ActiveModel::Serializer
  attributes :id,:ap_general_goal_id,:weight,:completedPercentage,:assignedWeight,:remaingWeight

  def assignedWeight
    self.object.ap_activities.sum(:weight)
  end

  def remaingWeight
    100 - self.object.ap_activities.sum(:weight)
  end
end
