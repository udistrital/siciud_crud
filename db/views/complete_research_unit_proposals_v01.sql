SELECT rgp.id,
       (SELECT json_build_object(
                       'id', id,
                       'name', name,
                       'acronym', acronym
                   )
        FROM research_groups
        WHERE rgp.research_group_id = id) AS research_unit,
       rgp.proposal_id,
       rgp.role_id,
       sr.st_name AS role_name,
       rgp.created_by,
       rgp.updated_by,
       rgp.created_at,
       rgp.updated_at
FROM research_groups_proposals rgp
         LEFT JOIN subtypes sr on sr.id = rgp.role_id;