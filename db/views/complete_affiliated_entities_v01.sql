SELECT ae.id,
       ae.research_network_id,
       rn.name AS research_network_name,
       ae.entity_id,
       e.name  AS entity_name,
       ae.institution_type_id,
       st.st_name AS institution_type_name,
       ae.geo_country_id,
       gc.name AS geo_country_name,
       ae.active,
       ae.created_by,
       ae.updated_by,
       ae.created_at,
       ae.updated_at
FROM affiliated_entities ae
         LEFT JOIN research_networks rn on rn.id = ae.research_network_id
         LEFT JOIN entities e on e.id = ae.entity_id
         LEFT JOIN subtypes st on st.id = ae.institution_type_id
         LEFT JOIN geo_countries gc on gc.id = e.geo_country_id;