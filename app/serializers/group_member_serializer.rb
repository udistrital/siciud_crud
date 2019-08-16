class GroupMemberSerializer < ActiveModel::Serializer
  attributes :id,:researcher,:role,:state_researcher,:gm_periods

  def researcher 
    self.object.researcher
  end
  def role
    self.object.role.name
  end
end
