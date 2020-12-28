class ScientificNoteSerializer < AbstractProductNewKnwGenSerializer
  attributes :id, :title, :approval_date, :category_id, :category_name, :doi,
             :final_page, :geo_city_id, :geo_city_name, :geo_country_id,
             :geo_country_name, :geo_state_id, :geo_state_name, :initial_page,
             :issn, :journal_id, :journal_name, :number_of_pages,
             :observation, :publication_date, :research_group_id, :url, :volume,
             :active, :created_by, :updated_by, :created_at, :updated_at

  def journal_name
    journal = self.object.journal
    if journal
      journal.name
    end
  end
end
