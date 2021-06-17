SELECT
    ep.administrative_act,
    ep.category_id,
    st.st_name AS category_name,
    ep.colciencias_call_id,
    cc.name    AS colciencias_call_name,
    cc.year    AS colciencias_call_year,
    ep.community_name,
    ep.final_date,
    ep.geo_city_id,
    gcity.name AS geo_city_name,
    ep.geo_country_id,
    gctry.name AS geo_country_name,
    ep.geo_state_id,
    gs.name    AS geo_state_name,
    ep.name_ext_project,
    ep.institution,
    ep.observation,
    ep.project_name,
    ep.start_date,
    ep.active,
    ep.research_group_id,
    ep.created_by,
    ep.updated_by,
    ep.created_at,
    ep.updated_at
FROM extension_projects ep
         LEFT JOIN subtypes st on ep.category_id = st.id
         LEFT JOIN colciencias_calls cc on ep.colciencias_call_id = cc.id
         LEFT JOIN geo_cities gcity on ep.geo_city_id = gcity.id
         LEFT JOIN geo_states gs on ep.geo_state_id = gs.id
         LEFT JOIN geo_countries gctry on ep.geo_country_id = gctry.id