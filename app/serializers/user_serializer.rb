class UserSerializer < ActiveModel::Serializer
  attributes :id, :username
  has_one :researcher
end
