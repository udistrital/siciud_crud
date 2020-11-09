class PaperSerializer < ActiveModel::Serializer
  attributes :id, :title, :publication_date, :approval_date, :volume,
             :number_of_pages, :initial_page, :final_page, :issn, :url, :doi,
             :observation, :category_id, :category_name, :journal_id, :journal_name,
             :paper_type_id, :paper_type_name, :research_group_id, :int_participants,
             :ext_participants, :geo_city_id, :geo_city_name, :geo_state_id,
             :geo_state_name, :geo_country_id, :geo_country_name

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
