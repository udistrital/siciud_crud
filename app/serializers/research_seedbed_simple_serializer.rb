class ResearchSeedbedSimpleSerializer < ActiveModel::Serializer
  attributes :id, :name, :acronym, :state_group

  def state_group
    state_group = self.object.state_group
    {
      id: state_group.id,
      name: state_group.name,
    }
  end
end
