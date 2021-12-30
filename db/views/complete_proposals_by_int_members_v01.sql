SELECT p.id,
       p.title,
       p.call_id,
       c.call_code,
       c.call_name,
       p.description,
       p.duration,
       p.geo_city_id,
       gcty."name" AS geo_city_name,
       p.geo_country_id,
       gctr."name" AS geo_country_name,
       p.geo_state_id,
       gs."name" AS geo_state_name,
       p.project_type_id,
       spj.st_name AS project_type_name,
       p.proposal_status_id,
       sps.st_name AS proposal_status_name,
       (SELECT count(*) FROM dependencies_proposals WHERE p.id = proposal_id) AS total_dependencies,
       (SELECT count(*) FROM entities_proposals WHERE p.id = proposal_id) AS total_entities,
       (SELECT count(*) FROM proposals_research_groups WHERE p.id = proposal_id) AS total_research_groups,
       imp.researcher_id,
       res.identification_number AS researcher_identification,
       p.active,
       p.created_at,
       p.updated_at,
       p.created_by,
       p.updated_by
FROM proposals p
         LEFT JOIN calls c on p.call_id = c.id
         LEFT JOIN geo_cities gcty on p.geo_city_id = gcty.id
         LEFT JOIN geo_countries gctr on p.geo_country_id = gctr.id
         LEFT JOIN geo_states gs on p.geo_state_id = gs.id
         LEFT JOIN subtypes spj ON p.project_type_id = spj.id
         LEFT JOIN subtypes sps ON p.proposal_status_id = sps.id
         LEFT JOIN internal_members_proposals imp on p.id = imp.proposal_id
         LEFT JOIN researchers res on imp.researcher_id = res.id;