SELECT rgrn.id,
       rgrn.research_group_id,
       rg.name AS research_group_name,
       rgrn.research_network_id,
       rgrn.has_expiration,
       rgrn.expiration_date,
       rgrn.active,
       rgrn.created_by,
       rgrn.updated_by,
       rgrn.created_at,
       rgrn.updated_at
FROM research_groups_research_networks rgrn
LEFT JOIN research_groups rg on rgrn.research_group_id = rg.id;