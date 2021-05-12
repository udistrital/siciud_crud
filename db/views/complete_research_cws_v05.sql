SELECT rcw.id,
       rcw.title,
       rcw.category_id,
       stc.st_name AS category_name,
       rcw.colciencias_call_id,
       cc.name AS colciencias_call_name,
       cc.year AS colciencias_call_year,
       rcw.creation_and_selection_date,
       rcw.geo_city_id,
       gcity.name AS geo_city_name,
       gs.geo_country_id,
       gctry.name AS geo_country_name,
       gcity.geo_state_id,
       gs.name    AS geo_state_name,
       rcw.knwl_spec_area_id,
       stksa.st_name AS knwl_spec_area_name,
       rcw.nature_of_work,
       rcw.observation,
       rcw.registered_project_title,
       rcw.url,
       ARRAY(SELECT rcwwt.subtype_id
             FROM research_creation_works_work_types rcwwt
             WHERE rcw.id = rcwwt.research_creation_work_id) AS work_type_ids,
       rcw.research_group_id,
       rcw.active,
       rcw.created_by,
       rcw.updated_by,
       rcw.created_at,
       rcw.updated_at
FROM research_creation_works rcw
         LEFT JOIN subtypes stc on rcw.category_id = stc.id
         LEFT JOIN colciencias_calls cc on rcw.colciencias_call_id = cc.id
         LEFT JOIN geo_cities gcity on rcw.geo_city_id = gcity.id
         LEFT JOIN geo_states gs on gcity.geo_state_id = gs.id
         LEFT JOIN geo_countries gctry on gs.geo_country_id = gctry.id
         LEFT JOIN subtypes stksa on rcw.knwl_spec_area_id = stksa.id;