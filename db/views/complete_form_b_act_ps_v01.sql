SELECT fbap.id,
       fbap.action_plan_id,
       fbap.description,
       fbap.financing_type_id,
       sft.st_name  AS financing_type_name,
       fbap.goal_achieved,
       fbap.goal_state_id,
       sgs.st_name  AS goal_state_name,
       fbap."order",
       fbap.plan_type_id,
       splt.st_name AS plan_type_name,
       fbap.active,
       fbap.created_by,
       fbap.updated_by,
       fbap.created_at,
       fbap.updated_at
FROM form_b_act_plans fbap
         LEFT JOIN subtypes sft ON sft.id = fbap.financing_type_id
         LEFT JOIN subtypes sgs ON sgs.id = fbap.goal_state_id
         LEFT JOIN subtypes splt ON fbap.plan_type_id = splt.id;