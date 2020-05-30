class CallProductionSerializer < ActiveModel::Serializer
  attributes :id, :production_id, :required, :quantity
end
