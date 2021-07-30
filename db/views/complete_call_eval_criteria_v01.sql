SELECT cec.id,
       cec.call_id,
       cec.eval_criterion_id,
       s.st_name AS eval_criterion_name,
       cec.cec_percentage,
       cec.active,
       cec.created_by,
       cec.updated_by,
       cec.created_at,
       cec.updated_at
FROM call_eval_criteria cec
         LEFT JOIN subtypes s on s.id = cec.eval_criterion_id;