SELECT la.id,
       la.work_name,
       la.category_id,
       st.st_name AS category_name,
       la.colciencias_call_id,
       cc.name    AS colciencias_call_name,
       cc.year    AS colciencias_call_year,
       la.contract_date,
       la.contract_geo_city_id,
       cgcity.name AS contract_geo_city_name,
       la.contract_geo_country_id,
       cgctry.name AS contract_geo_country_name,
       la.contract_geo_state_id,
       cgs.name    AS contract_geo_state_name,
       la.geo_city_id,
       gcity.name AS geo_city_name,
       la.geo_country_id,
       gctry.name AS geo_country_name,
       la.geo_state_id,
       gs.name    AS geo_state_name,
       la.license_grant_date,
       la.license_owner_institution,
       la.ncd_registry_number,
       la.observation,
       la.research_group_id,
       la.active,
       la.created_by,
       la.updated_by,
       la.created_at,
       la.updated_at
FROM license_agreements la
         LEFT JOIN subtypes st on la.category_id = st.id
         LEFT JOIN colciencias_calls cc on la.colciencias_call_id = cc.id
         LEFT JOIN geo_cities gcity on la.geo_city_id = gcity.id
         LEFT JOIN geo_states gs on la.geo_state_id = gs.id
         LEFT JOIN geo_countries gctry on la.geo_country_id = gctry.id
         LEFT JOIN geo_cities cgcity on la.contract_geo_city_id = cgcity.id
         LEFT JOIN geo_states cgs on la.contract_geo_state_id = cgs.id
         LEFT JOIN geo_countries cgctry on la.contract_geo_country_id = cgctry.id;