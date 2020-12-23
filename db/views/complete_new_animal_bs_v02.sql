SELECT nab.id,
       nab.name,
       nab.category_id,
       c.name AS category_name,
       nab.ccb_ica_document,
       nab.cycle_type_id,
       ct.name AS cycle_type_name,
       nab.date,
       nab.geo_city_id,
       gcity.name AS geo_city_name,
       gs.geo_country_id,
       gctry.name AS geo_country_name,
       gcity.geo_state_id,
       gs.name AS geo_state_name,
       nab.new_animal_breed_document,
       nab.observation,
       nab.petition_status_id,
       ps.name AS petition_status_name,
       nab.research_group_id,
       nab.active,
       nab.created_by,
       nab.updated_by,
       nab.created_at,
       nab.updated_at
FROM new_animal_breeds nab
INNER JOIN categories c on nab.category_id = c.id
INNER JOIN cycle_types ct on nab.cycle_type_id = ct.id
INNER JOIN geo_cities gcity on nab.geo_city_id = gcity.id
INNER JOIN geo_states gs on gcity.geo_state_id = gs.id
INNER JOIN geo_countries gctry on gs.geo_country_id = gctry.id
INNER JOIN petition_statuses ps on nab.petition_status_id = ps.id;