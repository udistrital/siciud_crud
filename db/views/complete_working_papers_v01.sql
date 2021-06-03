SELECT wp.id,
       wp.title,
       wp.category_id,
       st.st_name AS category_name,
       wp.colciencias_call_id,
       cc.name    AS colciencias_call_name,
       cc.year    AS colciencias_call_year,
       wp.doi,
       wp.elaboration_date,
       wp.observation,
       wp.related_institution,
       wp.research_group_id,
       wp.web_page,
       wp.active,
       wp.created_by,
       wp.updated_by,
       wp.created_at,
       wp.updated_at
FROM working_papers wp
         LEFT JOIN subtypes st on wp.category_id = st.id
         LEFT JOIN colciencias_calls cc on wp.colciencias_call_id = cc.id;