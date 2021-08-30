class FormDActPlanSerializer < AbstractActionPlanSerializer
  attributes :id, :action_plan_id, :name, :description, :goal_state_id,
             :goal_state_name, :goal_achieved, :order, :plan_type_id,
             :plan_type_name, :cine, :oecd, :snies, :research_focuses,
             :active, :created_by, :updated_by, :created_at, :updated_at

  def cine
    result = []
    cine_detailed_areas = self.object.cine_detailed_areas
    if cine_detailed_areas.empty?
      cine_specific_areas = self.object.cine_specific_areas
      unless cine_specific_areas.empty?
        result = get_cine_specific_structure(cine_specific_areas)
      end
    else
      result = get_cine_detailed_structure(cine_detailed_areas)
    end
    result
  end

  def oecd
    result = []
    oecd_disciplines = self.object.oecd_disciplines
    if oecd_disciplines.empty?
      oecd_knowledge_subareas = self.object.oecd_knowledge_subareas
      unless oecd_knowledge_subareas.empty?
        result = get_oecd_subarea_structure(oecd_knowledge_subareas)
      end
    else
      result = get_oecd_discipline_structure(oecd_disciplines)
    end
    result
  end

  def research_focuses
    complete_research_focuses = []
    research_focuses_list = self.object.research_focuses
    research_focuses_list.each do |research_focus|
      data = {
        "research_focus_id": research_focus.id,
        "research_focus_name": research_focus.st_name
      }
      complete_research_focuses.append(data)
    end
    complete_research_focuses
  end

  def snies
    complete_snies = []
    snies_list = self.object.snies
    snies_list.each do |snies|
      data = {
        "snies_id": snies.id,
        "snies_code": snies.code,
        "snies_name": snies.name
      }
      complete_snies.append(data)
    end
    complete_snies
  end


  private

  def get_cine_detailed_structure(cine_detailed_areas)
    complete_cine_structure = []
    specific_broad = {}
    specific_detailed = {}

    cine_detailed_areas.each { |detailed_area|
      specific_area = detailed_area.cine_specific_area
      broad_area = specific_area.cine_broad_area
      specific_area_key = specific_area.id.to_s
      detailed_area_data = {
        'id': detailed_area.id,
        'name': detailed_area.name
      }
      if specific_detailed.has_key? specific_area_key
        specific_detailed[specific_area_key].append(detailed_area_data)
      else
        specific_broad[specific_area_key] = {
          "broad_area_id": broad_area.id,
          "broad_area_name": broad_area.name,
          "specific_area_id": specific_area.id,
          "specific_area_name": specific_area.name,
        }
        specific_detailed[specific_area_key] = [detailed_area_data]
      end
    }

    specific_detailed.each do |key, value|
      data = {
        "cine_broad_area_id": specific_broad[key][:broad_area_id],
        "cine_broad_area_name": specific_broad[key][:broad_area_name],
        "cine_specific_area_id": specific_broad[key][:specific_area_id],
        "cine_specific_area_name": specific_broad[key][:specific_area_name],
        "cine_detailed_area_ids": value
      }
      complete_cine_structure.append(data)
    end
    complete_cine_structure
  end

  def get_cine_specific_structure(cine_specific_areas)
    complete_cine_structure = []

    cine_specific_areas.each { |specific_area|
      broad_area = specific_area.cine_broad_area
      data = {
        "cine_broad_area_id": broad_area.id,
        "cine_broad_area_name": broad_area.name,
        "cine_specific_area_id": specific_area.id,
        "cine_specific_area_name": specific_area.name,
        "cine_detailed_area_ids": []
      }
      complete_cine_structure.append(data)
    }
    complete_cine_structure
  end

  def get_oecd_discipline_structure(oecd_disciplines)
    complete_oecd_structure = []
    subarea_area = {}
    subarea_discipline = {}

    oecd_disciplines.each { |discipline|
      subarea = discipline.oecd_knowledge_subarea
      area = subarea.oecd_knowledge_area
      subarea_key = subarea.id.to_s
      discipline_data = {
        'id': discipline.id,
        'name': discipline.name
      }

      if subarea_discipline.has_key? subarea_key
        subarea_discipline[subarea_key].append(discipline_data)
      else
        subarea_area[subarea_key] = {
          "knowledge_area_id": area.id,
          "knowledge_area_name": area.name,
          "knowledge_subarea_id": subarea.id,
          "knowledge_subarea_name": subarea.name,
        }
        subarea_discipline[subarea_key] = [discipline_data]
      end
    }

    subarea_discipline.each do |key, value|
      data = {
        "oecd_knowledge_area_id": subarea_area[key][:knowledge_area_id],
        "oecd_knowledge_area_name": subarea_area[key][:knowledge_area_name],
        "oecd_knowledge_subarea_id": subarea_area[key][:knowledge_subarea_id],
        "oecd_knowledge_subarea_name": subarea_area[key][:knowledge_subarea_name],
        "oecd_discipline_ids": value
      }
      complete_oecd_structure.append(data)
    end
    complete_oecd_structure
  end

  def get_oecd_subarea_structure(oecd_knowledge_subareas)
    complete_oecd_structure = []

    oecd_knowledge_subareas.each { |subarea|
      area = subarea.oecd_knowledge_area
      data = {
        "oecd_knowledge_area_id": area.id,
        "oecd_knowledge_area_name": area.name,
        "oecd_knowledge_subarea_id": subarea.id,
        "oecd_knowledge_subarea_name": subarea.name,
        "oecd_discipline_ids": []
      }
      complete_oecd_structure.append(data)
    }
    complete_oecd_structure
  end
end
