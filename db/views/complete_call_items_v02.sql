SELECT ci.id,
       ci.call_id,
       ci.item_id,
       s.st_name AS item_name,
       ci.ci_maximum_percentage,
       ci.ci_percentage,
       ci.active,
       ci.created_by,
       ci.updated_by,
       ci.created_at,
       ci.updated_at
FROM call_items ci
         LEFT JOIN subtypes s on s.id = ci.item_id;