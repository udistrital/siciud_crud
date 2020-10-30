SELECT
    gcity.id,
    gcity.name,
    gcity.code,
    gcity.latitude,
    gcity.longitude,
    gcountry.id AS geo_country_id,
    gs.id AS geo_state_id,
    gs.name AS geo_state_name
FROM geo_countries gcountry
INNER JOIN geo_states gs on gs.geo_country_id = gcountry.id
INNER JOIN geo_cities gcity on gcity.geo_state_id = gs.id;