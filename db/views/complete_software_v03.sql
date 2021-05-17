SELECT soft.id,
       soft.category_id,
       st.st_name AS category_name,
       soft.colciencias_call_id,
       cc.name AS colciencias_call_name,
       cc.year AS colciencias_call_year,
       soft.geo_city_id,
       gcity.name AS geo_city_name,
       soft.geo_country_id,
       gctry.name AS geo_country_name,
       soft.geo_state_id,
       gs.name AS geo_state_name,
       soft.sof_date_of_obtaining,
       soft.sof_description,
       soft.sof_product_title,
       soft.sof_registration_number,
       soft.observation,
       soft.research_group_id,
       soft.active,
       soft.created_by,
       soft.updated_by,
       soft.created_at,
       soft.updated_at
FROM software soft
         LEFT JOIN subtypes st on soft.category_id = st.id
         LEFT JOIN colciencias_calls cc on soft.colciencias_call_id = cc.id
         LEFT JOIN geo_cities gcity on soft.geo_city_id = gcity.id
         LEFT JOIN geo_states gs on soft.geo_state_id = gs.id
         LEFT JOIN geo_countries gctry on soft.geo_country_id = gctry.id;