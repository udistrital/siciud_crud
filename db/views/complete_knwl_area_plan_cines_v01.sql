SELECT kp.id,
       kp.form_d_act_plan_id,
       kp.knwl_area_type,
       kp.knwl_area_id,
       cda.name  AS knwl_area_name,
       csa.id   AS knwl_area_parent_id,
       csa.name AS knwl_area_parent_name,
       cba.id   AS knwl_area_grandparent_id,
       cba.name AS knwl_area_grandparent_name,
       kp.active,
       kp.created_by,
       kp.updated_by,
       kp.created_at,
       kp.updated_at
FROM knwl_plans kp
         LEFT JOIN cine_detailed_areas cda ON kp.knwl_area_id = cda.id
         LEFT JOIN cine_specific_areas csa on cda.cine_specific_area_id = csa.id
         LEFT JOIN cine_broad_areas cba on csa.cine_broad_area_id = cba.id;