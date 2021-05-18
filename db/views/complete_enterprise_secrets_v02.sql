SELECT ens.id,
       ens.name,
       ens.category_id,
       st.st_name AS category_name,
       ens.colciencias_call_id,
       cc.name    AS colciencias_call_name,
       cc.year    AS colciencias_call_year,
       ens.contract_number,
       ens.contract_value,
       ens.date_of_obtaining,
       ens.geo_city_id,
       gcity.name AS geo_city_name,
       ens.geo_country_id,
       gctry.name AS geo_country_name,
       ens.geo_state_id,
       gs.name    AS geo_state_name,
       ens.observation,
       ens.research_group_id,
       ens.active,
       ens.created_by,
       ens.updated_by,
       ens.created_at,
       ens.updated_at
FROM enterprise_secrets ens
         LEFT JOIN subtypes st on ens.category_id = st.id
         LEFT JOIN colciencias_calls cc on ens.colciencias_call_id = cc.id
         LEFT JOIN geo_cities gcity on ens.geo_city_id = gcity.id
         LEFT JOIN geo_states gs on ens.geo_state_id = gs.id
         LEFT JOIN geo_countries gctry on ens.geo_country_id = gctry.id;