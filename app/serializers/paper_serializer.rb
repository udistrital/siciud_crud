class PaperSerializer < AbstractProductNewKnwGenSerializer
  attributes :id, :title, :approval_date, :category_id, :category_name, :doi,
             :final_page, :geo_city_id, :geo_city_name, :geo_country_id,
             :geo_country_name, :geo_state_id, :geo_state_name, :initial_page,
             :issn, :journal_id, :journal_name, :number_of_pages, :observation,
             :paper_type_id, :paper_type_name, :publication_date, :url,
             :volume, :active, :created_by, :updated_by, :created_at, :updated_at


  def journal_name
    journal = self.object.journal
    if journal
      journal.name
    end
  end

  def paper_type_name
    paper_type = self.object.paper_type
    if paper_type
      paper_type.name
    end
  end
end
