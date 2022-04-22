SELECT ap.id,
       (SELECT json_agg(json_build_object(
               'id', faap.id,
               'advanced_total', faap.advanced_total,
               'goal', faap.goal,
               'order', faap.order,
               'indicator_id', faap.indicator_id,
               'indicator_description', i.ind_description,
               'indicator_product_type_name', si.st_name,
               'plan_type_id', faap.plan_type_id,
               'plan_type_name', spt.st_name,
               'product_type_id', faap.product_type_id,
               'product_type_name', spr.st_name,
               'active', faap.active
           ))
        FROM siciud.form_a_act_plans faap
                 LEFT JOIN siciud.indicators i ON i.id = faap.indicator_id
                 LEFT JOIN siciud.subtypes si ON si.id = i.subtype_id
                 LEFT JOIN siciud.subtypes spt ON spt.id = faap.plan_type_id
                 LEFT JOIN siciud.subtypes spr ON spr.id = faap.product_type_id
        WHERE faap.action_plan_id = ap.id AND faap.plan_type_id = 781) AS form_a_training_processes,
       (SELECT json_agg(json_build_object(
               'id', faap.id,
               'advanced_total', faap.advanced_total,
               'goal', faap.goal,
               'order', faap.order,
               'indicator_id', faap.indicator_id,
               'indicator_description', i.ind_description,
               'indicator_product_type_name', si.st_name,
               'plan_type_id', faap.plan_type_id,
               'plan_type_name', spt.st_name,
               'product_type_id', faap.product_type_id,
               'product_type_name', spr.st_name,
               'active', faap.active
           ))
        FROM siciud.form_a_act_plans faap
                 LEFT JOIN siciud.indicators i ON i.id = faap.indicator_id
                 LEFT JOIN siciud.subtypes si ON si.id = i.subtype_id
                 LEFT JOIN siciud.subtypes spt ON spt.id = faap.plan_type_id
                 LEFT JOIN siciud.subtypes spr ON spr.id = faap.product_type_id
        WHERE faap.action_plan_id = ap.id AND faap.plan_type_id = 782) AS form_a_resulting_products,
       (SELECT json_agg(json_build_object(
               'id', fbap.id,
               'financing_type_id', fbap.financing_type_id,
               'financing_type_name', sft.st_name,
               'description', fbap.description,
               'goal_state_id', fbap.goal_state_id,
               'goal_state_name', sgs.st_name,
               'goal_achieved', fbap.goal_achieved,
               'order', fbap.order,
               'plan_type_id', fbap.plan_type_id,
               'plan_type_name', spt.st_name,
               'active', fbap.active
           ))
        FROM siciud.form_b_act_plans fbap
                 LEFT JOIN siciud.subtypes sft ON sft.id = fbap.financing_type_id
                 LEFT JOIN siciud.subtypes sgs ON sgs.id = fbap.goal_state_id
                 LEFT JOIN siciud.subtypes spt ON spt.id = fbap.plan_type_id
        WHERE fbap.action_plan_id = ap.id AND fbap.plan_type_id = 825) AS form_b_research_projects,
       (SELECT json_agg(json_build_object(
               'id', fcap.id,
               'product_type_id', fcap.product_type_id,
               'product_type_name', sprd.st_name,
               'description', fcap.description,
               'goal', fcap.goal,
               'advanced_total', fcap.advanced_total,
               'order', fcap.order,
               'plan_type_id', fcap.plan_type_id,
               'plan_type_name', spt.st_name,
               'child_prod_type_id', fcap.child_prod_type_id,
               'child_prod_type_name', schprd.st_name,
               'active', fcap.active
           ))
        FROM siciud.form_c_act_plans fcap
                 LEFT JOIN siciud.subtypes sprd ON sprd.id = fcap.product_type_id
                 LEFT JOIN siciud.subtypes spt ON spt.id = fcap.plan_type_id
                 LEFT JOIN siciud.subtypes schprd ON schprd.id = fcap.child_prod_type_id
        WHERE fcap.action_plan_id = ap.id AND fcap.plan_type_id = 826) AS form_c_potential_products,
       (SELECT json_agg(json_build_object(
               'id', fdap.id,
               'name', fdap.name,
               'description', fdap.description,
               'goal_state_id', fdap.goal_state_id,
               'goal_state_name', sgs.st_name,
               'goal_achieved', fdap.goal_achieved,
               'order', fdap.order,
               'plan_type_id', fdap.plan_type_id,
               'plan_type_name', spt.st_name,
               'active', fdap.active
           ))
        FROM siciud.form_d_act_plans fdap
                 LEFT JOIN siciud.subtypes sgs ON sgs.id = fdap.goal_state_id
                 LEFT JOIN siciud.subtypes spt ON spt.id = fdap.plan_type_id
        WHERE fdap.action_plan_id = ap.id AND fdap.plan_type_id = 828) AS form_d_academic_networks,
       (SELECT json_agg(json_build_object(
               'id', feap.id,
               'type_description', feap.type_description,
               'description', feap.description,
               'inventoried', feap.inventoried,
               'inventory_plate', feap.inventory_plate,
               'plan_type_id', feap.plan_type_id,
               'plan_type_name', spt.st_name,
               'classification_id', feap.classification_id,
               'classification_name', sc.st_name,
               'active', feap.active
           ))
        FROM siciud.form_e_act_plans feap
                 LEFT JOIN siciud.subtypes spt ON spt.id = feap.plan_type_id
                 LEFT JOIN siciud.subtypes sc ON sc.id = feap.classification_id
        WHERE feap.action_plan_id = ap.id AND feap.plan_type_id = 828) AS form_e_resources
FROM siciud.action_plans ap;