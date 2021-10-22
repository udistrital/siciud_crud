SELECT fdap.id,
       fdap.action_plan_id,
       fdap.name,
       fdap.description,
       fdap.goal_achieved,
       fdap.goal_state_id,
       sgs.st_name AS goal_state_name,
       fdap."order",
       fdap.plan_type_id,
       spl.st_name AS plan_type_name,
       (SELECT count(*) FROM cine_detailed_areas_form_d_act_plans WHERE form_d_act_plan_id = fdap.id) AS total_cine_detailed_areas,
       (SELECT count(*) FROM cine_specific_areas_form_d_act_plans WHERE form_d_act_plan_id = fdap.id) AS total_cine_specific_areas,
       (SELECT count(*) FROM form_d_act_plans_oecd_disciplines WHERE form_d_act_plan_id = fdap.id) AS total_oecd_disciplines,
       (SELECT count(*) FROM form_d_act_plans_oecd_knowledge_subareas WHERE form_d_act_plan_id = fdap.id) AS total_oecd_knowledge_subareas,
       (SELECT count(*) FROM research_focuses_form_d_plans WHERE form_d_act_plan_id = fdap.id) AS total_research_focuses,
       fdap.active,
       fdap.created_by,
       fdap.updated_by,
       fdap.created_at,
       fdap.updated_at
FROM form_d_act_plans fdap
         LEFT JOIN subtypes sgs on sgs.id = fdap.goal_state_id
         LEFT JOIN subtypes spl ON fdap.plan_type_id = spl.id;