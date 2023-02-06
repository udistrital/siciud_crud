SELECT p.id,
       (SELECT json_agg(
                       json_build_object(
                               'anonymous_evaluator_id', evaluator_criteria.anonymous_evaluator_id,
                               'code', evaluator_criteria.code,
                               'criteria', evaluator_criteria.criteria,
                               'total', evaluator_criteria.total
                           ))
        FROM (
                 SELECT DISTINCT
                 ON (pe.anonymous_evaluator_id) anonymous_evaluator_id,
                     ae.code,
                     ae.total,
                     (SELECT json_agg(
                     json_build_object(
                     'id', pec.id,
                     'call_eval_criterion_id', pec.call_eval_criterion_id,
                     'eval_criterion_id', cec.eval_criterion_id,
                     'eval_criterion_name', scec.st_name,
                     'value', pec.value,
                     'active', pec.active,
                     'created_by', pec.created_by,
                     'updated_by', pec.updated_by
                     ))
                     FROM proposal_evaluations pec
                     LEFT JOIN call_eval_criteria cec ON pec.call_eval_criterion_id = cec.id
                     LEFT JOIN subtypes scec ON cec.eval_criterion_id = scec.id
                     WHERE pec.anonymous_evaluator_id = ae.id
                     ) AS criteria
                 FROM proposal_evaluations pe
                     LEFT JOIN anonymous_evaluators ae
                 ON pe.anonymous_evaluator_id = ae.id
                 WHERE pe.proposal_id = p.id
             ) AS evaluator_criteria
       ) AS anonymous_evaluators,
       p.active,
       p.created_by,
       p.updated_by,
       p.created_at,
       p.updated_at
FROM proposals p;