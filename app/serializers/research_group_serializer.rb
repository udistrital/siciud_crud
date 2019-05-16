class ResearchGroupSerializer < ActiveModel::Serializer
    include Rails.application.routes.url_helpers
  attributes :id, :name, :acronym, :description,:cidcRegistrationDate,
  :faculties,:cidcActNumber,:facultyActNumber,:facultyRegistrationDate,
  :email,:gruplac,:webpage,:mission,:vision,:colcienciasCode,:curricular_projects,
  :state_group,:snies,:research_focuses,:facultyActDocument,:cidcActDocument,:director,
  :historicalColciencias
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
#    research_focuses = self.object.research_focuses
    
  end
  def director
    members = self.object.members.where(role_id:1).last
    {
      name: members.researcher.name,
      lastName: members.researcher.lastName,
      initialDate: members.initialDate,
      finalDate: members.finalDate,
      academicEmail: members.researcher.academicEmail,
      researcherType: members.researcher.researcher_type.name

    }

  end
  def facultyActDocument
    rails_blob_path(self.object.facultyActDocument, only_path: true) if self.object.facultyActDocument.attached?
  end
  def cidcActDocument
    rails_blob_path(self.object.cidcActDocument, only_path: true) if self.object.cidcActDocument  .attached?
  end
  def historicalColciencias
    if self.object.historical_colciencias_ranks
      self.object.historical_colciencias_ranks.map do |rank|
        { 
          call: rank.colciencias_call, 
          rank: rank.colciencias_category}
      end 
    end
  end

  
end

