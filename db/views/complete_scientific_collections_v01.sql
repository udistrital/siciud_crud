SELECT sc.id,
       sc.name,
       sc.category_id,
       st.st_name AS category_name,
       sc.colciencias_call_id,
       cc.name    AS colciencias_call_name,
       cc.year    AS colciencias_call_year,
       sc.curator_name,
       sc.date_of_obtaining,
       sc.geo_city_id,
       gcity.name AS geo_city_name,
       gs.geo_country_id,
       gctry.name AS geo_country_name,
       gcity.geo_state_id,
       gs.name    AS geo_state_name,
       sc.information_included,
       sc.last_conservatorship_date,
       sc.managing_institution_name,
       sc.observation,
       sc.research_group_id,
       sc.validity_and_use,
       sc.active,
       sc.created_by,
       sc.updated_by,
       sc.created_at,
       sc.updated_at
FROM scientific_collections sc
         LEFT JOIN subtypes st on sc.category_id = st.id
         LEFT JOIN colciencias_calls cc on sc.colciencias_call_id = cc.id
         LEFT JOIN geo_cities gcity on sc.geo_city_id = gcity.id
         LEFT JOIN geo_states gs on gcity.geo_state_id = gs.id
         LEFT JOIN geo_countries gctry on gs.geo_country_id = gctry.id;
