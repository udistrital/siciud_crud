class ResearchGroupSerializer < ActiveModel::Serializer
  attributes :id, :name, :acronym, :description,:cidcRegistrationDate,:faculties,:cidcActNmber,:facultyActNumber,:facultyRegistrationDate,:email,:gruplac,:webpage,:mission,:vision,:colcienciasCode,:curricular_project,:state_group,:snies,:research_focus
  def faculties
    faculties = self.object.faculties
  end
  def curricular_project
    curricular_project = self.object.curricular_project
    {
      name: curricular_project.name
    }
    
  end

  def state_group
    state_group = self.object.state_group
    {
      name: state_group.name
    }
    
  end
  def snies
    snies = self.object.snies
    {
      name: snies.name
    }
  end
  def research_focus
    research_focus = self.object.research_focus
    {
      name: research_focus.name
    }
    
  end
  
end
