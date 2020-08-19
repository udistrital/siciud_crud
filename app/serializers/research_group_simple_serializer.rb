class ResearchGroupSimpleSerializer < ActiveModel::Serializer
  attributes :id, :name, :acronym, :state_group, :cidcRegistrationDate, :director_name,
             :faculty_ids, :facultyRegistrationDate, :curricular_project_ids,
             :research_focuses, :oecd_disciplines, :cine_detailed_areas

  def director_name
    members = self.object.group_members.where(role_id: 1).last
    if members
      members.researcher.name.concat(" ", members.researcher.lastName)
    end
  end

  def cine_detailed_areas
    cine_detailed_area = self.object.cine_detailed_areas
    if cine_detailed_area
      cine_detailed_area.map do |cda|
        cda.name
      end
    end
  end

  def oecd_disciplines
    oecd_discipline = self.object.oecd_disciplines
    if oecd_discipline
      oecd_discipline.map do |od|
        od.name
      end
    end
  end

  def research_focuses
    research_focus = self.object.research_focuses
    if research_focus
      research_focus.map do |rf|
        rf.name
      end

    end
  end

  def state_group
    state_group = self.object.state_group
    if state_group
      state_group.name
    end
  end
end
