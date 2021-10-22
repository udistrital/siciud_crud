SELECT ap.id,
       ap.execution_validity,
       ap.research_group_id,
       rg.name AS research_group_name,
       rg.acronym AS research_group_acronym,
       rg.gruplac AS research_group_gruplac,
       ap.is_draft,
       ap.active,
       ap.created_by,
       ap.updated_by,
       ap.created_at,
       ap.updated_at
FROM action_plans ap
         LEFT JOIN research_groups rg on rg.id = ap.research_group_id;