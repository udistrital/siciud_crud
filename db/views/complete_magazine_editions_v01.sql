SELECT me.id,
       me.editorial_name,
       me.editorial_date,
       me.category_id,
       st.st_name AS category_name,
       me.colciencias_call_id,
       cc.name    AS colciencias_call_name,
       cc.year    AS colciencias_call_year,
       me.geo_city_id,
       gcity.name AS geo_city_name,
       me.geo_country_id,
       gctry.name AS geo_country_name,
       me.geo_state_id,
       gs.name    AS geo_state_name,
       me.issn,
       me.observation,
       me.publication_year,
       me.research_group_id,
       me.title,
       me.active,
       me.created_by,
       me.updated_by,
       me.created_at,
       me.updated_at
FROM magazine_editions me
         LEFT JOIN subtypes st on me.category_id = st.id
         LEFT JOIN colciencias_calls cc on me.colciencias_call_id = cc.id
         LEFT JOIN geo_cities gcity on me.geo_city_id = gcity.id
         LEFT JOIN geo_states gs on me.geo_state_id = gs.id
         LEFT JOIN geo_countries gctry on me.geo_country_id = gctry.id;