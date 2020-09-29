class GroupMemberBaseSerializer < ActiveModel::Serializer
  attributes :id, :researcher_id, :role, :gm_state
end
