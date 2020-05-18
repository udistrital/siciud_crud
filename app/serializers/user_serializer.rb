class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :user_roles;
  has_one :researcher
  #
  #

end
