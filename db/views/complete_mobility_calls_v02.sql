SELECT mc.id,
       mc.call_id,
       c.call_name,
       mc.event_date,
       mc.event_edition_number,
       mc.event_name,
       mc.event_page,
       mc.geo_city_id,
       gcity.name AS geo_city_name,
       mc.geo_country_id,
       gctry.name AS geo_country_name,
       mc.geo_state_id,
       gs.name AS geo_state_name,
       mc.is_organizer,
       mc.paper_name,
       mc.research_group_id,
       rg.name AS research_group_name,
       mc.researcher_id,
       r.oas_researcher_id,
       mc.state_id,
       ss.st_name AS state_name,
       mc.total,
       mc.active,
       mc.created_by,
       mc.updated_by,
       mc.created_at,
       mc.updated_at
FROM mobility_calls mc
         LEFT JOIN calls c ON c.id = mc.call_id
         LEFT JOIN geo_cities gcity on mc.geo_city_id = gcity.id
         LEFT JOIN geo_states gs on mc.geo_state_id = gs.id
         LEFT JOIN geo_countries gctry on mc.geo_country_id = gctry.id
         LEFT JOIN research_groups rg on mc.research_group_id = rg.id
         LEFT JOIN researchers r on mc.researcher_id = r.id
         LEFT JOIN subtypes ss on mc.state_id = ss.id
;