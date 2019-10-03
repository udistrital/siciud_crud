class ArpGeneralGoalSerializer < ActiveModel::Serializer
  attributes :id,:goal,:agreement_research_project_id,:completedPercentage,:assignedWeight,:remaingWeight
  
  def assignedWeight
    self.object.arp_specific_goals.sum(:weight)
  end
  def remaingWeight
    100- self.object.arp_specific_goals.sum(:weight)
  end
end
