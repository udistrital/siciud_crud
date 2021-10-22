SELECT hlr.id,
       hlr.entity_id,
       e.name AS entity_name,
       hlr.legal_representative_id,
       lr.name AS legal_representative_name,
       lr.identification_number AS legal_representative_identification,
       lr.email AS legal_representative_email,
       lr.identification_type_id AS legal_representative_identification_type,
       hlr.is_current,
       hlr.active,
       hlr.created_by,
       hlr.updated_by,
       hlr.created_at,
       hlr.updated_at
FROM hist_legal_representatives hlr
LEFT JOIN entities e on hlr.entity_id = e.id
LEFT JOIN legal_representatives lr on hlr.legal_representative_id = lr.id;