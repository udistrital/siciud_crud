class GroupMemberSerializer < ActiveModel::Serializer
  attributes :id, :researcher, :role, :state_researcher, :gm_periods

  def researcher
    self.object.researcher
  end

  def role
    
      #id: self.object.role.id,
      #name: 
      self.object.role.name

    
  end

  def gm_periods
    self.object.gm_periods.map do |gm_period|
      {
        id: gm_period.id,
        initialDate: gm_period.initialDate,
        finalDate: gm_period.finalDate,
        role_id: gm_period.role_id,
        roleName: gm_period.role.name        
      }
    end
    #    res
  end
end
