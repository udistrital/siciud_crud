SELECT bl.id,
       bl.title,
       bl.category_id,
       st.st_name AS category_name,
       bl.colciencias_call_id,
       cc.name    AS colciencias_call_name,
       cc.year    AS colciencias_call_year,
       bl.observation,
       bl.research_group_id,
       bl.active,
       bl.created_by,
       bl.updated_by,
       bl.created_at,
       bl.updated_at
FROM bills bl
         LEFT JOIN subtypes st on bl.category_id = st.id
         LEFT JOIN colciencias_calls cc on bl.colciencias_call_id = cc.id;