class FacultySerializer < ActiveModel::Serializer
  attributes :id,:name,:curricular_projects
  
  def curricular_projects
      curricular_projects = self.object.curricular_projects
  end
  
end
