SELECT kp.id,
       kp.form_d_act_plan_id,
       kp.knwl_area_type,
       kp.knwl_area_id,
       od.name AS knwl_area_name,
       oks.id AS knwl_area_parent_id,
       oks.name AS knwl_area_parent_name,
       oka.id AS knwl_area_grandparent_id,
       oka.name AS knwl_area_grandparent_name,
       kp.active,
       kp.created_by,
       kp.updated_by,
       kp.created_at,
       kp.updated_at
FROM knwl_plans kp
         LEFT JOIN oecd_disciplines od ON kp.knwl_area_id = od.id
         LEFT JOIN oecd_knowledge_subareas oks on od.oecd_knowledge_subarea_id = oks.id
         LEFT JOIN oecd_knowledge_areas oka on oks.oecd_knowledge_area_id = oka.id;