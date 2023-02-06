SELECT p.id,
       p.title,
       p.call_id,
       c.call_code,
       c.call_name,
       p.project_type_id,
       spj.st_name AS project_type_name,
       imp.researcher_id,
       res.identification_number,
       res.oas_researcher_id,
       imp.role_id,
       rol.name AS role_name,
       p.active,
       p.created_at,
       p.updated_at,
       p.created_by,
       p.updated_by
FROM proposals p
LEFT JOIN calls c on p.call_id = c.id
LEFT JOIN subtypes spj ON p.project_type_id = spj.id
LEFT JOIN internal_members_proposals imp on p.id = imp.proposal_id
LEFT JOIN researchers res on imp.researcher_id = res.id
LEFT JOIN roles rol on imp.role_id = rol.id
