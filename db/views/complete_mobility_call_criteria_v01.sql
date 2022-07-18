SELECT mc.id,
       (SELECT json_agg(
           json_build_object(
               'id', mcc.id,
               'call_eval_criterion_id', mcc.call_eval_criterion_id,
               'eval_criterion_id', cec.eval_criterion_id,
               'eval_criterion_name', scec.st_name,
               'value', mcc.value,
               'active', mcc.active,
               'created_by', mcc.created_by,
               'updated_by', mcc.updated_by
               ))
           FROM mobility_call_criteria mcc
           LEFT JOIN call_eval_criteria cec ON mcc.call_eval_criterion_id = cec.id
           LEFT JOIN subtypes scec ON cec.eval_criterion_id = scec.id
            WHERE mcc.mobility_call_id = mc.id
           ) AS criteria,
       mc.active,
       mc.created_by,
       mc.updated_by,
       mc.created_at,
       mc.updated_at
FROM mobility_calls mc;