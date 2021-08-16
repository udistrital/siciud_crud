class OtriProfessionalSerializer < ActiveModel::Serializer
  attributes :id, :email, :phone, :created_by, :updated_by, :active, :user_id, :professional_role_id, :created_at, :updated_at

end
