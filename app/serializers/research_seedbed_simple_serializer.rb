class ResearchSeedbedSimpleSerializer < ActiveModel::Serializer
  attributes :id, :name, :acronym, :state_seedbed

  def state_seedbed
    state_seedbed = self.object.state_seedbed
    {
      id: state_seedbed.id,
      name: state_seedbed.name
    }
  end
end
