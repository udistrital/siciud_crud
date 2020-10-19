class BookChapterSerializer < ActiveModel::Serializer
  attributes :id, :book_title, :title, :publication_date, :isbn, :doi, :url, :observation
  has_one :category
  has_one :editorial
  has_one :research_group
end
