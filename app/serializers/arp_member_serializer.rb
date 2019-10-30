class ArpMemberSerializer < ActiveModel::Serializer
  attributes :id, :arp_role_id, :agreement_id, :group_member_id, :agreement_research_project_id, :researcher_id

  def researcher_id
    self.object.group_member.researcher.id
  end
  def research_group_id
    self.object.group_member.research_group_id
  end
end
