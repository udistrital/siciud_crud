class ResearchNetworkSerializer < ActiveModel::Serializer
  attributes :id, :name, :acronym, :request_date,
             :mission, :vision, :advantage, :faculty_ids,
             :main_research_group_id, :main_research_group_name,
             :network_type_id, :network_type_name,
             :academic_responsibilities, :financial_responsibilities,
             :legal_responsibilities, :researcher_id,
             :cine_broad_area_id, :cine_broad_area_name,
             :cine_specific_area_id, :cine_specific_area_name,
             :cine_detailed_area_ids,
             :research_focus_ids, :snies_ids,
             :oecd_knowledge_subarea_id, :oecd_knowledge_subarea_name,
             :oecd_knowledge_area_id, :oecd_knowledge_area_name,
             :oecd_discipline_ids, :research_group_ids,
             :active, :created_by, :updated_by, :created_at, :updated_at

  def main_research_group_name
    main_research_group = self.object.main_research_group
    if main_research_group
      main_research_group.name
    end
  end

  def network_type_name
    network_type = self.object.network_type
    if network_type
      network_type.st_name
    end
  end

  def cine_broad_area_name
    cine_broad_area = self.object.cine_broad_area
    if cine_broad_area
      cine_broad_area.name
    end
  end

  def cine_specific_area_name
    cine_specific_area = self.object.cine_specific_area
    if cine_specific_area
      cine_specific_area.name
    end
  end

  def faculty_ids
    faculty_id = self.object.faculty_ids_research_networks
    if faculty_id
      faculty_id.map do |faculty|
        faculty.faculty_id
      end
    end
  end

  def oecd_knowledge_subarea_name
    oecd_knowledge_subarea = self.object.oecd_knowledge_subarea
    if oecd_knowledge_subarea
      oecd_knowledge_subarea.name
    end
  end

  def oecd_knowledge_area_name
    oecd_knowledge_area = self.object.oecd_knowledge_area
    if oecd_knowledge_area
      oecd_knowledge_area.name
    end
  end
end
