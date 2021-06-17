SELECT
    ac.category_id,
    st.st_name AS category_name,
    ac.colciencias_call_id,
    cc.name    AS colciencias_call_name,
    cc.year    AS colciencias_call_year,
    ac.date,
    ac.geo_city_id,
    gcity.name AS geo_city_name,
    ac.geo_country_id,
    gctry.name AS geo_country_name,
    ac.geo_state_id,
    gs.name    AS geo_state_name,
    ac.institution,
    ac.observation,
    ac.project_name,
    ac.active,
    ac.research_group_id,
    ac.created_by,
    ac.updated_by,
    ac.created_at,
    ac.updated_at
FROM accompaniment_consultancies ac
         LEFT JOIN subtypes st on ac.category_id = st.id
         LEFT JOIN colciencias_calls cc on ac.colciencias_call_id = cc.id
         LEFT JOIN geo_cities gcity on ac.geo_city_id = gcity.id
         LEFT JOIN geo_states gs on ac.geo_state_id = gs.id
         LEFT JOIN geo_countries gctry on ac.geo_country_id = gctry.id