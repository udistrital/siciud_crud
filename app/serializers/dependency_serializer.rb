class DependencySerializer < ActiveModel::Serializer
  attributes :id, :name, :entity_id, :entity_name,
             :active, :created_by, :updated_by,
             :created_at, :updated_at


  def entity_name
    entity = self.object.entity
    if entity
      entity.name
    end
  end
end
