class ScientificNoteSerializer < ActiveModel::Serializer
  attributes :id, :title, :journal_title, :publication_date, :volume, :number_of_pages, :initial_page, :final_page, :issn, :url, :doi, :observation
  has_one :category
  has_one :journal
  has_one :research_group
end
