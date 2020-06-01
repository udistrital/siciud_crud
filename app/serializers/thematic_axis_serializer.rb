class ThematicAxisSerializer < ActiveModel::Serializer
  attributes :thematic_axis_id

  def thematic_axis_id
    self.object.id do |id|
      id
    end
  end
end
