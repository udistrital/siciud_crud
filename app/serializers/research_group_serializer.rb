class ResearchGroupSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :name, :acronym, :cidc_act_document, :cidc_act_number,
             :cidc_registration_date,
             :cine_detailed_area_ids,
             :cine_broad_area_id, :cine_specific_area_id,
             :colciencias_code, :curricular_project_ids, :description,
             :establishment_document, :email, :faculty_act_document,
             :faculty_act_number, :faculty_ids, :faculty_registration_date,
             :group_type_id, :group_type_name, :gruplac, :historical_colciencias,
             :interinstitutional,
             :mission, :oecd_knowledge_subarea_id,
             :oecd_knowledge_area_id,
             :oecd_discipline_ids, :research_focus_ids,
             :snies_id, :state_id, :state_name, :vision, :webpage,
             :created_by, :updated_by, :created_at, :updated_at

  # def cidc_act_document
  #   rails_blob_path(self.object.cidc_act_document,
  #                   only_path: true) if self.object.cidc_act_document.attached?
  # end

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

  # def establishment_document
  #   rails_blob_path(self.object.establishment_document,
  #                   only_path: true) if self.object.establishment_document.attached?
  # end
  #
  # def faculty_act_document
  #   rails_blob_path(self.object.faculty_act_document,
  #                   only_path: true) if self.object.faculty_act_document.attached?
  # end

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

  def historical_colciencias
    if self.object.historical_colciencias_ranks
      self.object.historical_colciencias_ranks.map do |rank|
        {
            call: rank.colciencias_call,
            rank: rank.colciencias_category,
        }
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
end
