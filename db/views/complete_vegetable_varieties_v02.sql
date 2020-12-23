SELECT vv.id,
       vv.name,
       vv.category_id,
       c.name AS category_name,
       vv.cycle_type_id,
       ct.name AS cycle_type_name,
       vv.date,
       vv.geo_city_id,
       gcity.name AS geo_city_name,
       gs.geo_country_id,
       gctry.name AS geo_country_name,
       gcity.geo_state_id,
       gs.name AS geo_state_name,
       vv.observation,
       vv.petition_status_id,
       ps.name AS petition_status_name,
       vv.research_group_id,
       vv.vegetable_variety_document,
       vv.active,
       vv.created_by,
       vv.updated_by,
       vv.created_at,
       vv.updated_at
FROM vegetable_varieties vv
INNER JOIN categories c on vv.category_id = c.id
INNER JOIN cycle_types ct on vv.cycle_type_id = ct.id
INNER JOIN geo_cities gcity on vv.geo_city_id = gcity.id
INNER JOIN geo_states gs on gcity.geo_state_id = gs.id
INNER JOIN geo_countries gctry on gs.geo_country_id = gctry.id
INNER JOIN petition_statuses ps on vv.petition_status_id = ps.id;