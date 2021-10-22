class CallItemSerializer < ActiveModel::Serializer
  attributes :id, :call_id, :item_id, :item_name, :ci_maximum_percentage,
             :ci_percentage, :active, :created_by, :updated_by, :created_at,
             :updated_at

  def item_name
    item = self.object.item
    if item
      item.st_name
    end
  end
end
