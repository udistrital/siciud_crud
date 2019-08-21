class GroupMemberBaseSerializer < ActiveModel::Serializer
  attributes :id, :researcher, :role, :state_researcher

  def researcher
    {
      name: self.object.researcher.name,
      lastName: self.object.researcher.lastName

    }
  end

  def role
    {
      id: self.object.role.id,
      name: self.object.role.name,

    }
  end
end
