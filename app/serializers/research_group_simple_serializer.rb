class ResearchGroupSimpleSerializer < ActiveModel::Serializer
  attributes :id, :name, :acronym, :state_group_id, :cidcRegistrationDate, :director_name,
             :faculty_ids, :facultyRegistrationDate, :curricular_project_ids,
             :research_focus_ids, :oecd_discipline_ids, :cine_detailed_area_ids

  def director_name
    members = self.object.group_members.where(role_id: 1).last
    if members
      members.researcher.name.concat(" ", members.researcher.lastName)
    end
  end
end
