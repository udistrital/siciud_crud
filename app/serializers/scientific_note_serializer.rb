class ScientificNoteSerializer < AbstractProductNewKnwGenSerializer
  attributes :id, :title, :category_id, :category_name, :doi, :ext_participants,
             :final_page, :geo_city_id, :geo_city_name, :geo_country_id,
             :geo_country_name, :geo_state_id, :geo_state_name, :initial_page,
             :int_participants, :issn, :journal_id, :journal_name,
             :journal_title, :number_of_pages, :observation, :publication_date,
             :research_group_id, :url, :volume

  def journal_name
    journal = self.object.journal
    if journal
      journal.name
    end
  end
end
