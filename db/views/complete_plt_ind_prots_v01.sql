SELECT pltind.id,
       pltind.category_id,
       st.st_name AS category_name,
       pltind.colciencias_call_id,
       cc.name AS colciencias_call_name,
       cc.year AS colciencias_call_year,
       pltind.geo_country_id,
       gctry.name AS geo_country_name,
       pltind.plt_name,
       pltind.plt_date_of_elaboration,
       pltind.plt_registration_number,
       pltind.plt_type_id,
       pltind.observation,
       pltind.research_group_id,
       pltind.active,
       pltind.created_by,
       pltind.updated_by,
       pltind.created_at,
       pltind.updated_at
FROM plant_ind_prototypes pltind
         LEFT JOIN subtypes st on pltind.category_id = st.id
         LEFT JOIN colciencias_calls cc on pltind.colciencias_call_id = cc.id
         LEFT JOIN geo_countries gctry on pltind.geo_country_id = gctry.id;