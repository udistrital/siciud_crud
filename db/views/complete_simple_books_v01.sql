SELECT sb.category_id,
       st.st_name AS category_name,
       sb.editorial_name,
       sb.colciencias_call_id,
       cc.name    AS colciencias_call_name,
       cc.year    AS colciencias_call_year,
       sb.geo_city_id,
       gcity.name AS geo_city_name,
       sb.geo_country_id,
       gctry.name AS geo_country_name,
       sb.geo_state_id,
       gs.name    AS geo_state_name,
       sb.isbn,
       sb.observation,
       sb.publication_date,
       sb.product_type_id,
       pst.st_name AS product_type_name,
       sb.title,
       sb.url,
       sb.active,
       sb.research_group_id,
       sb.created_by,
       sb.updated_by,
       sb.created_at,
       sb.updated_at
FROM simple_books sb
         LEFT JOIN subtypes st on sb.category_id = st.id
         LEFT JOIN colciencias_calls cc on sb.colciencias_call_id = cc.id
         LEFT JOIN geo_cities gcity on sb.geo_city_id = gcity.id
         LEFT JOIN geo_states gs on sb.geo_state_id = gs.id
         LEFT JOIN geo_countries gctry on sb.geo_country_id = gctry.id
         LEFT JOIN subtypes pst on sb.product_type_id = pst.id