SELECT i.id,
       i.subtype_id,
       sin.st_name AS subtype_name,
       i.ind_description,
       i.active,
       i.created_by,
       i.updated_by,
       i.created_at,
       i.updated_at
FROM indicators i
         LEFT JOIN subtypes sin ON sin.id = i.subtype_id;