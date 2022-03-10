class AbstractMemberSerializer < ActiveModel::Serializer
  def role_name
    role = self.object.role
    if role
      role.name
    end
  end
end