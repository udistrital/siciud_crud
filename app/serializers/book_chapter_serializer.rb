class BookChapterSerializer < AbstractProductNewKnwGenSerializer
  attributes :id, :book_title, :title, :publication_date, :isbn, :doi, :url,
             :observation, :category_id, :category_name, :editorial_id,
             :editorial_name, :research_group_id, :int_participants,
             :ext_participants, :geo_city_id, :geo_city_name, :geo_state_id,
             :geo_state_name, :geo_country_id, :geo_country_name,
             :book_chapter_document


  def book_chapter_document
    rails_blob_path(self.object.book_chapter_document,
                    only_path: true) if self.object.book_chapter_document.attached?
  end
end
