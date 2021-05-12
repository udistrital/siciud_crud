SELECT intp.id,
       intp.producible_type AS product_type,
       intp.producible_id   AS product_type_id,
       intp.researcher_id,
       r.oas_researcher_id,
       intp.participant_type_id,
       pt.st_name              AS participant_type_name,
       intp.active,
       intp.created_by,
       intp.updated_by,
       intp.created_at,
       intp.updated_at
FROM int_participants intp
         LEFT JOIN researchers r on r.id = intp.researcher_id
         LEFT JOIN subtypes pt on pt.id = intp.participant_type_id;