class GmPeriodSerializer < ActiveModel::Serializer
  attributes :id, :initial_date, :final_date, :role_id, :role_name,
             :group_member_id, :active, :created_by, :updated_by,
             :created_at, :updated_at

  def role_name
    role = self.object.role
    if role
      role.name
    end
  end
end
