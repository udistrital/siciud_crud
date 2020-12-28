SELECT p.id,
       p.title,
       p.category_id,
       c.name AS category_name,
       p.date_of_obtaining,
       ARRAY(SELECT gcp.geo_country_id FROM  geo_countries_patents gcp WHERE p.id = gcp.patent_id) AS geo_country_ids,
       p.industrial_publication_gazette,
       p.observation,
       p.patent_certificate_document,
       p.patent_number,
       p.patent_state_id,
       ps.name AS patent_state_name,
       p.research_group_id,
       p.active,
       p.created_by,
       p.updated_by,
       p.created_at,
       p.updated_at
FROM patents p
LEFT JOIN categories c on p.category_id = c.id
LEFT JOIN patent_states ps on p.patent_state_id = ps.id;