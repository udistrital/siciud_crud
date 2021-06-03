SELECT p.id,
       p.title,
       p.approval_date,
       p.category_id,
       stc.st_name  AS category_name,
       p.colciencias_call_id,
       cc.name      AS colciencias_call_name,
       cc.year      AS colciencias_call_year,
       p.doi,
       p.final_page,
       p.geo_city_id,
       gcity.name   AS geo_city_name,
       p.geo_country_id,
       gctry.name   AS geo_country_name,
       p.geo_state_id,
       gs.name      AS geo_state_name,
       p.initial_page,
       p.issn,
       p.journal_name,
       p.number_of_pages,
       p.observation,
       p.paper_type_id,
       stpt.st_name AS paper_type_name,
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
         LEFT JOIN subtypes stc on p.category_id = stc.id
         LEFT JOIN colciencias_calls cc on p.colciencias_call_id = cc.id
         LEFT JOIN geo_cities gcity on p.geo_city_id = gcity.id
         LEFT JOIN geo_states gs on p.geo_state_id = gs.id
         LEFT JOIN geo_countries gctry on p.geo_country_id = gctry.id
         LEFT JOIN subtypes stpt on p.paper_type_id = stpt.id;