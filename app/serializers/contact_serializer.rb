class ContactSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :phone,
             :active, :created_by, :updated_by,
             :created_at, :updated_at
end
