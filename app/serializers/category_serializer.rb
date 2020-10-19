class CategorySerializer < ActiveModel::Serializer
  attributes :id, :name
  has_one :product_type
end
