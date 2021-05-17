SELECT np.id,
       np.name,
       np.category_id,
       st.st_name AS category_name,
       np.colciencias_call_id,
       cc.name    AS colciencias_call_name,
       cc.year    AS colciencias_call_year,
       np.consecutive_registration_invima,
       np.date_of_obtaining,
       np.geo_city_id,
       gcity.name AS geo_city_name,
       np.geo_country_id,
       gctry.name AS geo_country_name,
       np.geo_state_id,
       gs.name    AS geo_state_name,
       np.observation,
       np.research_group_id,
       np.research_project_title,
       np.active,
       np.created_by,
       np.updated_by,
       np.created_at,
       np.updated_at
FROM nutraceutical_products np
         LEFT JOIN subtypes st on np.category_id = st.id
         LEFT JOIN colciencias_calls cc on np.colciencias_call_id = cc.id
         LEFT JOIN geo_cities gcity on np.geo_city_id = gcity.id
         LEFT JOIN geo_states gs on np.geo_state_id = gs.id
         LEFT JOIN geo_countries gctry on np.geo_country_id = gctry.id;