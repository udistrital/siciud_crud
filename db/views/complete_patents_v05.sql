SELECT p.id,
       p.title,
       p.category_id,
       stc.st_name AS category_name,
       p.colciencias_call_id,
       cc.name AS colciencias_call_name,
       cc.year AS colciencias_call_year,
       p.date_of_obtaining,
       ARRAY(SELECT gcp.geo_country_id FROM  geo_countries_patents gcp WHERE p.id = gcp.patent_id) AS geo_country_ids,
       p.industrial_publication_gazette,
       p.observation,
       p.patent_state_id,
       stps.st_name AS patent_state_name,
       p.patent_number,
       p.research_group_id,
       p.active,
       p.created_by,
       p.updated_by,
       p.created_at,
       p.updated_at
FROM patents p
LEFT JOIN subtypes stc on p.category_id = stc.id
LEFT JOIN colciencias_calls cc on p.colciencias_call_id = cc.id
LEFT JOIN subtypes stps on p.patent_state_id = stps.id;