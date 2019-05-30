class ResearchSeedbedSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :name, :acronym, :description, :cidcRegistrationDate,
             :faculties, :cidcActNumber, :facultyActNumber, :facultyRegistrationDate,
             :mail, :webpage, :mission, :vision, :curricular_projects,
             :state_seedbed, :research_focuses,:snies, :facultyActDocument, :cidcActDocument,:director

  def faculties
    self.object.faculties.map do |faculty|
      {
          id: faculty.id,
          name: faculty.name,
      }
    end
    #faculties = self.object.faculties
  end

  def curricular_projects
    self.object.curricular_projects.map do |curricular_project|
      {
          id: curricular_project.id,
          name: curricular_project.name,
          faculty_id: curricular_project.faculty_id
      }
    end
    #curricular_projects = self.object.curricular_projects
  end

  def state_group
    state_group = self.object.state_group
    {
        id: state_group.id,
        name: state_group.name
    }
  end


  def snies
    snies = self.object.snies
    snies.name
  end


  def research_focuses
    self.object.research_focuses.map do |research_focus|
      {
         id: research_focus.id,
         name: research_focus.name,
         faculty_id: research_focus.faculty_id}
    end
        research_focuses = self.object.research_focuses
  end


  def director

    members = self.object.member_seedbeds.where(role_id: 1).last
    if members
      {
          name: members.researcher.name,
          lastName: members.researcher.lastName,
          initialDate: members.initialDate,
          finalDate: members.finalDate,
          academicEmail: members.researcher.academicEmail,
          researcherType: members.researcher.researcher_type.name

      }
    end
  end

  def facultyActDocument
    rails_blob_path(self.object.facultyActDocument, only_path: true) if self.object.facultyActDocument.attached?
  end

  def cidcActDocument
    rails_blob_path(self.object.cidcActDocument, only_path: true) if self.object.cidcActDocument.attached?
  end



end
