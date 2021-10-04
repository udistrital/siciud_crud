SELECT ent.id,
       ent.name,
       ent.nit,
       ent.check_digit,
       ent.constitution_date,
       ent.email,
       ent.headquarters_address,
       ent.institution_type_id,
       sit.st_name AS institution_type_name,
       ent.geo_city_id,
       ent.geo_country_id,
       ent.geo_state_id,
       ent.legal_nature_id,
       sln.st_name AS legal_nature_name,
       ent.legal_representative_id,
       lr.name AS legal_representative_name,
       ent.phone,
       ent.registration,
       ent.web_page,
       ent.active,
       ent.created_by,
       ent.updated_by,
       ent.created_at,
       ent.updated_at
FROM entities ent
         LEFT JOIN subtypes sit on ent.institution_type_id = sit.id
         LEFT JOIN subtypes sln on ent.legal_nature_id = sln.id
         LEFT JOIN legal_representatives lr on ent.legal_representative_id = lr.id;