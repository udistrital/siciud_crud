SELECT cd.id,
       cd.call_id,
       cd.document_id,
       s.st_name AS document_name,
       cd.cd_required,
       cd.active,
       cd.created_by,
       cd.updated_by,
       cd.created_at,
       cd.updated_at
FROM call_documents cd
         LEFT JOIN subtypes s on s.id = cd.document_id;