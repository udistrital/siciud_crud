class GroupMemberBaseSerializer < ActiveModel::Serializer
  attributes :id, :researcher_id, :role, :state_researcher
end
