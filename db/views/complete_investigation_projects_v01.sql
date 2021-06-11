SELECT
    ip.category_id,
    st.st_name AS category_name,
    ip.colciencias_call_id,
    cc.name    AS colciencias_call_name,
    cc.year    AS colciencias_call_year,
    ip.funding_institution,
    ip.geo_city_id,
    gcity.name AS geo_city_name,
    ip.geo_country_id,
    gctry.name AS geo_country_name,
    ip.geo_state_id,
    gs.name    AS geo_state_name,
    ip.institution,
    ip.observation,
    ip.product_type_id,
    pst.st_name AS product_type_name,
    ip.title,
    ip.year,
    ip.active,
    ip.research_group_id,
    ip.created_by,
    ip.updated_by,
    ip.created_at,
    ip.updated_at
FROM investigation_projects ip
         LEFT JOIN subtypes st on ip.category_id = st.id
         LEFT JOIN colciencias_calls cc on ip.colciencias_call_id = cc.id
         LEFT JOIN geo_cities gcity on ip.geo_city_id = gcity.id
         LEFT JOIN geo_states gs on ip.geo_state_id = gs.id
         LEFT JOIN geo_countries gctry on ip.geo_country_id = gctry.id
         LEFT JOIN subtypes pst on ip.product_type_id = pst.id