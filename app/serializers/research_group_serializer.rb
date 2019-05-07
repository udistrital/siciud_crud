class ResearchGroupSerializer < ActiveModel::Serializer
  attributes :id, :name, :acronym, :description,:cidcRegistrationDate,:faculties,:cidcActNmber,:facultyActNumber,:facultyRegistrationDate,:email,:gruplac,:webpage,:mission,:vision,:colcienciasCode,:curricular_projects,:state_group,:snies,:research_focuses,:director
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
      academicEmail: members.researcher.academicEmail

    }

  end
  
end

