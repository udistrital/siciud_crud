SELECT faap.id,
       faap.action_plan_id,
       faap.advanced_total,
       faap.goal,
       faap.indicator_id,
       i.ind_description AS indicator_description,
       i.product_type_id AS indicator_product_type_id,
       sip.st_name AS indicator_product_type_name,
       faap."order",
       faap.plan_type_id,
       splt.st_name AS plan_type_name,
       faap.product_type_id,
       spt.st_name AS product_type_name,
       faap.active,
       faap.created_by,
       faap.updated_by,
       faap.created_at,
       faap.updated_at
FROM form_a_act_plans faap
         LEFT JOIN indicators i ON faap.indicator_id = i.id
         LEFT JOIN subtypes sip ON i.product_type_id = sip.id
         LEFT JOIN subtypes spt ON faap.product_type_id = spt.id
         LEFT JOIN subtypes splt ON faap.plan_type_id = splt.id;