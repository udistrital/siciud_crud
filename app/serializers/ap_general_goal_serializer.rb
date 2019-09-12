class ApGeneralGoalSerializer < ActiveModel::Serializer
  attributes :id,:goal,:agreement_research_project_id,:completedPercentage,:assignedWeight,:remaingWeight
  
  def assignedWeight
    self.object.ap_specific_goals.sum(:weight)
  end
  def remaingWeight
    100- self.object.ap_specific_goals.sum(:weight) 
  end
end
