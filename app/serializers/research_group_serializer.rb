class ResearchGroupSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :name, :acronym, :description, :cidc_registration_date,
             :faculty_ids, :curricular_project_ids, :cidc_act_number, :faculty_act_number,
             :faculty_registration_date, :email, :gruplac, :webpage, :mission, :vision,
             :colciencias_code, :group_state_id, :group_state_name, :snies_id, :research_focus_ids,
             :faculty_act_document, :cidc_act_document, :document_of_establishment,
             :director, :oecd_discipline_ids, :cine_detailed_area_ids, :group_type_id,
             :group_type_name

  def director
    members = self.object.group_members.where(role_id: 1).last
    if members
      members.researcher
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

  def faculty_ids
    faculty_id = self.object.faculty_ids_research_groups
    if faculty_id
      faculty_id.map do |faculty|
        faculty.faculty_id
      end
    end
  end

  def faculty_act_document
    rails_blob_path(self.object.faculty_act_document,
                    only_path: true) if self.object.faculty_act_document.attached?
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

  def cidc_act_document
    rails_blob_path(self.object.cidc_act_document,
                    only_path: true) if self.object.cidc_act_document.attached?
  end

  def document_of_establishment
    rails_blob_path(self.object.document_of_establishment,
                    only_path: true) if self.object.document_of_establishment.attached?
  end

  def historicalColciencias
    if self.object.historical_colciencias_ranks
      self.object.historical_colciencias_ranks.map do |rank|
        {
            call: rank.colciencias_call,
            rank: rank.colciencias_category,
        }
      end
    end
  end
end
