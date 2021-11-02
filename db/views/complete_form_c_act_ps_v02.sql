SELECT fcap.id,
       fcap.action_plan_id,
       fcap.advanced_total,
       fcap.description,
       fcap.goal,
       fcap."order",
       fcap.plan_type_id,
       spl.st_name AS plan_type_name,
       fcap.child_prod_type_id,
       scpt.st_name AS child_prod_type_name,
       fcap.product_type_id,
       spt.st_name AS product_type_name,
       fcap.active,
       fcap.created_by,
       fcap.updated_by,
       fcap.created_at,
       fcap.updated_at
FROM form_c_act_plans fcap
         LEFT JOIN subtypes spl ON fcap.plan_type_id = spl.id
         LEFT JOIN subtypes spt ON fcap.product_type_id = spt.id
         LEFT JOIN subtypes scpt ON fcap.child_prod_type_id = scpt.id;