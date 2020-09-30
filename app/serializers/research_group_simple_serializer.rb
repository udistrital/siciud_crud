class ResearchGroupSimpleSerializer < ActiveModel::Serializer
  attributes :id, :name, :acronym, :cidc_registration_date, :cidc_act_number,
             :faculty_act_number, :faculty_registration_date,
             :faculty_ids, :curricular_project_ids,
             :state_id, :state_name, :group_type_id,
             :group_type_name, :director_id, :director_oas_id,
             :research_focus_id, :oecd_discipline_ids, :cine_detailed_area_ids


  def cine_detailed_area_id
    cine_detailed_area = self.object.cine_detailed_areas
    if cine_detailed_area
      cine_detailed_area.map do |cda|
        cda.id
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

  def director_id
    members = self.object.group_members.where(role_id: 1).last
    if members
      members.researcher.id
    end
  end

  def director_oas_id
    members = self.object.group_members.where(role_id: 1).last
    if members
      members.researcher.oas_researcher_id
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

  def group_type_name
    type = self.object.group_type
    if type
      type.name
    end
  end

  def research_focus_id
    research_focus = self.object.research_focuses
    if research_focus
      research_focus.map do |rf|
        rf.id
      end
    end
  end

  def state_id
    state = self.object.group_state
    if state
      state.id
    end
  end

  def state_name
    state = self.object.group_state
    if state
      state.name
    end
  end

  def oecd_discipline_id
    oecd_discipline = self.object.oecd_disciplines
    if oecd_discipline
      oecd_discipline.map do |od|
        od.id
      end
    end
  end
end
