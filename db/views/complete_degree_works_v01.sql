SELECT dw.id,
       dw.category_id,
       st.st_name AS category_name,
       dw.colciencias_call_id,
       cc.name    AS colciencias_call_name,
       cc.year    AS colciencias_call_year,
       dw.dw_title,
       dw.dw_date,
       dw.dw_institution_name,
       dw.dw_recognition,
       dw.dw_type_id,
       dwt.st_name AS dw_type_name,
       dw.dw_observation,
       dw.research_group_id,
       dw.active,
       dw.created_by,
       dw.updated_by,
       dw.created_at,
       dw.updated_at
FROM degree_works dw
         LEFT JOIN subtypes st on dw.category_id = st.id
         LEFT JOIN subtypes dwt on dw.category_id = dwt.id
         LEFT JOIN colciencias_calls cc on dw.colciencias_call_id = cc.id;