class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :publication_date, :isbn, :url, :observation
  has_one :category
  has_one :editorial
  has_one :research_group
end
