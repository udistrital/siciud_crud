class ActionPlanSerializer < ActiveModel::Serializer
  attributes :id, :execution_validity, :research_group_id,
             :research_group_name, :research_group_acronym,
             :research_group_gruplac, :is_draft,
             :management_report_is_draft, :active,
             :created_by, :updated_by, :created_at, :updated_at,
             :published_at, :management_report_published_at


  def research_group_acronym
    research_group = self.object.research_group
    if research_group
      research_group.acronym
    end
  end

  def research_group_gruplac
    research_group = self.object.research_group
    if research_group
      research_group.gruplac
    end
  end

  def research_group_name
    research_group = self.object.research_group
    if research_group
      research_group.name
    end
  end
end
