class FormDActPlanSerializer < AbstractActionPlanSerializer
  attributes :id, :action_plan_id, :name, :description, :goal_state_id,
             :goal_state_name, :goal_achieved, :order, :plan_type_id,
             :plan_type_name, :cine, :oecd,
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

  private

  def get_cine_detailed_structure(cine_detailed_areas)
    complete_cine_structure = []
    specific_detailed = {}
    specific_broad = {}

    cine_detailed_areas.each { |detailed_area|
      specific_area = detailed_area.cine_specific_area
      broad_area = specific_area.cine_broad_area
      specific_area_key = specific_area.id.to_s

      if specific_detailed.has_key? specific_area_key
        specific_detailed[specific_area_key].append(detailed_area.id)
      else
        specific_broad[specific_area_key] = broad_area.id
        specific_detailed[specific_area_key] = [detailed_area.id]
      end
    }

    specific_detailed.each do |key, value|
      data = {
        "cine_broad_area_id": specific_broad[key],
        "cine_specific_area_id": key,
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
        "cine_specific_area_id": specific_area.id,
        "cine_detailed_area_ids": []
      }
      complete_cine_structure.append(data)
    }
    complete_cine_structure
  end

  def get_oecd_discipline_structure(oecd_disciplines)
    complete_oecd_structure = []
    subarea_discipline = {}
    subarea_area = {}

    oecd_disciplines.each { |discipline|
      subarea = discipline.oecd_knowledge_subarea
      area = subarea.oecd_knowledge_area
      subarea_key = subarea.id.to_s

      if subarea_discipline.has_key? subarea_key
        subarea_discipline[subarea_discipline].append(discipline.id)
      else
        subarea_area[subarea_discipline] = area.id
        subarea_discipline[subarea_discipline] = [discipline.id]
      end
    }

    subarea_discipline.each do |key, value|
      data = {
        "oecd_knowledge_area_id": subarea_area[key],
        "oecd_knowledge_subarea_id": key,
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
        "oecd_knowledge_subarea_id": subarea.id,
        "oecd_discipline_ids": []
      }
      complete_oecd_structure.append(data)
    }
    complete_oecd_structure
  end
end
