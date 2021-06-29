SELECT extp.id,
       extp.producible_type AS product_type,
       extp.producible_id   AS product_type_id,
       extp.first_name,
       extp.last_name,
       extp.orcid_id,
       extp.participant_type_id,
       pt.st_name              AS participant_type_name,
       extp.active,
       extp.created_by,
       extp.updated_by,
       extp.created_at,
       extp.updated_at
FROM ext_participants extp
         LEFT JOIN subtypes pt on pt.id = extp.participant_type_id;