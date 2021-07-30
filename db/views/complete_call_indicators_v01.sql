SELECT cind.id,
       cind.call_id,
       cind.indicator_id,
       i.ind_description AS indicator_description,
       i.product_type_id,
       s.st_name AS product_type_name,
       cind.active,
       cind.created_by,
       cind.updated_by,
       cind.created_at,
       cind.updated_at
FROM calls_indicators cind
         LEFT JOIN indicators i on i.id = cind.indicator_id
         LEFT JOIN subtypes s on i.product_type_id = s.id;