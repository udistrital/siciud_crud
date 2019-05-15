class ResearchFocusSerializer < ActiveModel::Serializer
  attributes :id, :name,:faculty
  def faculty
    faculty = self.object.faculty
    {
      id: faculty.id,
     name: faculty.name
    }
    
  end
end
