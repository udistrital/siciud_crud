class CallItemCategorySerializer < ActiveModel::Serializer
  attributes :id, :percentage, :value, :maximum_percentage, :item_category_id
end
