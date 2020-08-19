class ResearchGroupSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :name, :acronym, :description, :cidcRegistrationDate,
             :faculty_ids, :cidcActNumber, :facultyActNumber, :facultyRegistrationDate,
             :email, :gruplac, :webpage, :mission, :vision, :colcienciasCode, :curricular_project_ids,
             :state_group_id, :snies_id, :research_focus_ids, :facultyActDocument, :cidcActDocument,
             :director_name, :historicalColciencias, :oecd_discipline_ids, :cine_detailed_area_ids

  def director_name
    members = self.object.group_members.where(role_id: 1).last
    if members
      members.researcher.name.concat(" ", members.researcher.lastName)
    end
  end

  def facultyActDocument
    rails_blob_path(self.object.facultyActDocument, only_path: true) if self.object.facultyActDocument.attached?
  end

  def cidcActDocument
    rails_blob_path(self.object.cidcActDocument, only_path: true) if self.object.cidcActDocument.attached?
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
