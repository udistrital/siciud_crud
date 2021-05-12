SELECT ind.id,
       ind.category_id,
       st.st_name AS category_name,
       ind.colciencias_call_id,
       cc.name AS colciencias_call_name,
       cc.year AS colciencias_call_year,
       ind.geo_country_id,
       gctry.name AS geo_country_name,
       ind.ind_dsg_date_of_obtaining,
       ind.ind_dsg_industrial_publication_gazette,
       ind.ind_dsg_registration_number,
       ind.ind_dsg_registration_title,
       ind.observation,
       ind.research_group_id,
       ind.active,
       ind.created_by,
       ind.updated_by,
       ind.created_at,
       ind.updated_at
FROM industrial_designs ind
         LEFT JOIN subtypes st on ind.category_id = st.id
         LEFT JOIN colciencias_calls cc on ind.colciencias_call_id = cc.id
         LEFT JOIN geo_countries gctry on ind.geo_country_id = gctry.id;