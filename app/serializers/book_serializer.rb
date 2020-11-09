class BookSerializer < AbstractProductNewKnwGenSerializer
  include Rails.application.routes.url_helpers
  attributes :id, :title, :publication_date, :isbn, :url, :observation,
             :category_id, :category_name, :editorial_id, :editorial_name,
             :research_group_id, :int_participants, :ext_participants,
             :geo_city_id, :geo_city_name, :geo_state_id, :geo_state_name,
             :geo_country_id, :geo_country_name, :book_document

  def book_document
    rails_blob_path(self.object.book_document, only_path: true) if self.object.book_document.attached?
  end
end
