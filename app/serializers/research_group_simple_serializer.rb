class ResearchGroupSimpleSerializer < ActiveModel::Serializer
  attributes :id, :name, :acronym, :cidc_registration_date, :cidc_act_number,
             :faculty_act_number, :faculty_registration_date,
             :faculty_ids, :curricular_project_ids,
             :research_focuses, :oecd_disciplines, :cine_detailed_areas,
             :group_state_id, :group_state_name, :group_type_id,
             :group_type_name, :director


  def cine_detailed_areas
    cine_detailed_area = self.object.cine_detailed_areas
    if cine_detailed_area
      cine_detailed_area.map do |cda|
        cda.name
      end
    end
  end

  def curricular_project_ids
    curr_prj = self.object.curricular_prj_ids_research_groups
    if curr_prj
      curr_prj.map do |curr|
        curr.curricular_project_id
      end
    end
  end

  def director
    members = self.object.group_members.where(role_id: 1).last
    if members
      members.researcher
    end
  end

  def faculty_ids
    faculty_id = self.object.faculty_ids_research_groups
    if faculty_id
      faculty_id.map do |faculty|
        faculty.faculty_id
      end
    end
  end

  def group_state_name
    state = self.object.group_state
    if state
      state.name
    end
  end

  def group_type_name
    type = self.object.group_type
    if type
      type.name
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
