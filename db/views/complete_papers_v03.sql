SELECT p.id,
       p.title,
       p.approval_date,
       p.category_id,
       c.name AS category_name,
       p.doi,
       p.final_page,
       p.geo_city_id,
       gcity.name AS geo_city_name,
       gs.geo_country_id,
       gctry.name AS geo_country_name,
       gcity.geo_state_id,
       gs.name AS geo_state_name,
       p.initial_page,
       p.issn,
       p.journal_id,
       j.name AS journal_name,
       p.number_of_pages,
       p.observation,
       p.paper_type_id,
       pt.name AS paper_type_name,
       p.publication_date,
       p.research_group_id,
       p.url,
       p.volume,
       p.active,
       p.created_by,
       p.updated_by,
       p.created_at,
       p.updated_at
FROM papers p
LEFT JOIN categories c on p.category_id = c.id
LEFT JOIN geo_cities gcity on p.geo_city_id = gcity.id
LEFT JOIN geo_states gs on gcity.geo_state_id = gs.id
LEFT JOIN geo_countries gctry on gs.geo_country_id = gctry.id
LEFT JOIN journals j on p.journal_id = j.id
LEFT JOIN paper_types pt on p.paper_type_id = pt.id;