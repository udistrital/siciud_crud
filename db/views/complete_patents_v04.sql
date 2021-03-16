SELECT p.id,
       p.title,
       p.date_of_obtaining,
       ARRAY(SELECT gcp.geo_country_id FROM  geo_countries_patents gcp WHERE p.id = gcp.patent_id) AS geo_country_ids,
       p.industrial_publication_gazette,
       p.observation,
       p.patent_number,
       p.research_group_id,
       p.active,
       p.created_by,
       p.updated_by,
       p.created_at,
       p.updated_at
FROM patents p;