SELECT pltind.id,
       pltind.category_id,
       st.st_name     AS category_name,
       pltind.colciencias_call_id,
       cc.name        AS colciencias_call_name,
       cc.year        AS colciencias_call_year,
       pltind.geo_city_id,
       gcity.name AS geo_city_name,
       gs.geo_country_id,
       gctry.name AS geo_country_name,
       gcity.geo_state_id,
       gs.name AS geo_state_name,
       pltind.institution_name,
       pltind.plt_name,
       pltind.plt_date_of_elaboration,
       pltind.plt_registration_number,
       pltind.plt_type_id,
       stplt.st_name  AS plt_type_name,
       pltind.observation,
       pltind.research_group_id,
       pltind.active,
       pltind.created_by,
       pltind.updated_by,
       pltind.created_at,
       pltind.updated_at
FROM plant_ind_prototypes pltind
         LEFT JOIN subtypes st on pltind.category_id = st.id
         LEFT JOIN subtypes stplt on pltind.plt_type_id = stplt.id
         LEFT JOIN colciencias_calls cc on pltind.colciencias_call_id = cc.id
         LEFT JOIN geo_cities gcity on pltind.geo_city_id = gcity.id
         LEFT JOIN geo_states gs on gcity.geo_state_id = gs.id
         LEFT JOIN geo_countries gctry on gs.geo_country_id = gctry.id;