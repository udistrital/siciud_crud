SELECT sn.id,
       sn.title,
       sn.approval_date,
       sn.category_id,
       st.st_name AS category_name,
       sn.colciencias_call_id,
       cc.name AS colciencias_call_name,
       cc.year AS colciencias_call_year,
       sn.doi,
       sn.final_page,
       sn.geo_city_id,
       gcity.name AS geo_city_name,
       gs.geo_country_id,
       gctry.name AS geo_country_name,
       gcity.geo_state_id,
       gs.name    AS geo_state_name,
       sn.initial_page,
       sn.issn,
       sn.journal_name,
       sn.number_of_pages,
       sn.observation,
       sn.publication_date,
       sn.research_group_id,
       sn.url,
       sn.volume,
       sn.active,
       sn.created_by,
       sn.updated_by,
       sn.created_at,
       sn.updated_at
FROM scientific_notes sn
LEFT JOIN subtypes st on sn.category_id = st.id
LEFT JOIN colciencias_calls cc on sn.colciencias_call_id = cc.id
LEFT JOIN geo_cities gcity on sn.geo_city_id = gcity.id
LEFT JOIN geo_states gs on gcity.geo_state_id = gs.id
LEFT JOIN geo_countries gctry on gs.geo_country_id = gctry.id;