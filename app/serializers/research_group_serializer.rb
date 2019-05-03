class ResearchGroupSerializer < ActiveModel::Serializer
  attributes :id, :name, :acronym, :description,:cidcRegistrationDate,:faculties,:cidcActNmber,:facultyActNumber,:facultyRegistrationDate,:email,:gruplac,:webpage,:mission,:vision,:colcienciasCode,:curricular_projects,:state_group,:snies,:research_focus,:director
  def faculties
    faculties = self.object.faculties
  end
  def curricular_projects
    curricular_projects = self.object.curricular_projects
    
  end

  def state_group
    state_group = self.object.state_group
    state_group.name
    
    
  end
  def snies
    snies = self.object.snies
    snies.name
  end
  def research_focus
    research_focuses = self.object.research_focuses
    
  end
  def director
    members = self.object.members.where(role_id:1).first
    {
      name: members.researcher.name,
      lastName: members.researcher.lastName,
      initialDate: members.initialDate,
      finalDate: members.finalDate,
      academicEmail: members.researcher.academicEmail

    }
  end
  
end

