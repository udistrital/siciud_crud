SELECT rcw.id,
       rcw.title,
       rcw.creation_and_selection_date,
       rcw.geo_city_id,
       gcity.name AS geo_city_name,
       gs.geo_country_id,
       gctry.name AS geo_country_name,
       gcity.geo_state_id,
       gs.name    AS geo_state_name,
       rcw.nature_of_work,
       rcw.observation,
       rcw.registered_project_title,
       rcw.url,
       rcw.research_group_id,
       rcw.active,
       rcw.created_by,
       rcw.updated_by,
       rcw.created_at,
       rcw.updated_at
FROM research_creation_works rcw
LEFT JOIN geo_cities gcity on rcw.geo_city_id = gcity.id
LEFT JOIN geo_states gs on gcity.geo_state_id = gs.id
LEFT JOIN geo_countries gctry on gs.geo_country_id = gctry.id;