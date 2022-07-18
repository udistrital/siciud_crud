class ResearchGroupsProposalSerializer < ActiveModel::Serializer
  attributes :id, :role_id, :role_name,
             :proposal_id, :research_unit,
             :active, :created_by, :updated_by,
             :created_at, :updated_at

  def research_unit
    research_group = self.object.research_group
    if research_group
      {
        "id": research_group.id,
        "name": research_group.name,
        "acronym": research_group.acronym
      }
    end
  end

  def role_name
    role = self.object.role
    if role
      role.st_name
    end
  end
end
