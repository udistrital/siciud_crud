SELECT
    ib.category_id,
    st.st_name AS category_name,
    ib.colciencias_call_id,
    cc.name    AS colciencias_call_name,
    cc.year    AS colciencias_call_year,
    ib.elaboration_date,
    ib.geo_city_id,
    gcity.name AS geo_city_name,
    ib.geo_country_id,
    gctry.name AS geo_country_name,
    ib.geo_state_id,
    gs.name    AS geo_state_name,
    ib.institution,
    ib.observation,
    ib.title,
    ib.url,
    ib.active,
    ib.research_group_id,
    ib.created_by,
    ib.updated_by,
    ib.created_at,
    ib.updated_at
FROM informative_bulletins ib
         LEFT JOIN subtypes st on ib.category_id = st.id
         LEFT JOIN colciencias_calls cc on ib.colciencias_call_id = cc.id
         LEFT JOIN geo_cities gcity on ib.geo_city_id = gcity.id
         LEFT JOIN geo_states gs on ib.geo_state_id = gs.id
         LEFT JOIN geo_countries gctry on ib.geo_country_id = gctry.id