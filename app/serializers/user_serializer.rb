class UserSerializer < ActiveModel::Serializer
  attributes :id, :identification_number, :oas_user_id, :user_role_id,
             :user_role_name, :active, :created_by, :updated_by,
             :created_at, :updated_at


  def user_role_name
    user_role = self.object.user_role
    if user_role
      user_role.name
    end
  end
end
