class PaperSerializer < ActiveModel::Serializer
  attributes :id, :title, :publication_date, :approval_date, :volume, :number_of_pages, :initial_page, :final_page, :issn, :url, :doi, :observation
  has_one :category
  has_one :journal
  has_one :paper_type
  has_one :research_group
end
