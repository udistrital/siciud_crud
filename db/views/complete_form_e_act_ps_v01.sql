SELECT feap.id,
       feap.action_plan_id,
       feap.classification_id,
       scl.st_name AS classification_name,
       feap.description,
       feap.type_description,
       feap.inventoried,
       feap.inventory_plate,
       feap.plan_type_id,
       splt.st_name AS plan_type_name,
       feap.active,
       feap.created_by,
       feap.updated_by,
       feap.created_at,
       feap.updated_at
FROM form_e_act_plans feap
         LEFT JOIN subtypes scl ON feap.classification_id = scl.id
         LEFT JOIN subtypes splt ON feap.plan_type_id = splt.id;