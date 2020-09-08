class ResearchGroupSimpleSerializer < ActiveModel::Serializer
  attributes :id, :name, :acronym, :state_group, :cidcRegistrationDate,
             :director_name_tmp, :director,
             :facultyIds, :curricular_projectIds, :facultyRegistrationDate,
             :research_focuses, :oecd_disciplines, :cine_detailed_areas

  def cine_detailed_areas
    cine_detailed_area = self.object.cine_detailed_areas
    if cine_detailed_area
      cine_detailed_area.map do |cda|
        cda.name
      end
    end
  end

  def curricular_projectIds
    curr_prj = self.object.curricular_prj_ids_research_groups
    if curr_prj
      curr_prj.map do |curr|
        curr.curricular_projectId
      end
    end
  end

  def director
    members = self.object.group_members.where(role_id: 1).last
    if members
      members.researcher
    end
  end

  def facultyIds
    faculty_id = self.object.faculty_ids_research_groups
    if faculty_id
      faculty_id.map do |faculty|
        faculty.facultyId
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
