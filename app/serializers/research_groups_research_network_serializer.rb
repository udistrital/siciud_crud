class ResearchGroupsResearchNetworkSerializer < ActiveModel::Serializer
  attributes :id, :has_expiration, :expiration_date, :research_network_id,
             :research_group_id, :research_group_name,
             :active, :created_by, :updated_by, :created_at, :updated_at

  def research_group_name
    research_group = self.object.research_group
    if research_group
      research_group.name
    end
  end
end
