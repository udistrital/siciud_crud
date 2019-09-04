class ArpMemberSerializer < ActiveModel::Serializer
  attributes :id, :arp_role_id, :agreement_id, :group_member_id, :agreement_research_project_id, :researcher

  def researcher
    {
      name: self.object.group_member.researcher.name,
      lastName: self.object.group_member.researcher.lastName,

    }
  end
end
