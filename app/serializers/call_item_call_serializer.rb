class CallItemCallSerializer < ActiveModel::Serializer
  attributes :id, :percentage, :value, :maximum_percentage, :item_call_id
end
