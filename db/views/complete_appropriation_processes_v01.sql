SELECT ap.id,
       ap.name,
       ap.category_id,
       st.st_name AS category_name,
       ap.colciencias_call_id,
       cc.name    AS colciencias_call_name,
       cc.year    AS colciencias_call_year,
       ap.funding_institution,
       ap.start_date,
       ap.finish_date,
       ap.observation,
       ap.product_type_id,
       pt.st_name AS product_type_name,
       ap.research_group_id,
       ap.research_project_title,
       ap.active,
       ap.created_by,
       ap.updated_by,
       ap.created_at,
       ap.updated_at
FROM appropriation_processes ap
         LEFT JOIN subtypes st on ap.category_id = st.id
         LEFT JOIN colciencias_calls cc on ap.colciencias_call_id = cc.id
         LEFT JOIN subtypes pt on ap.product_type_id = pt.id;