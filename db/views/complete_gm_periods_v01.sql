SELECT gp.id,
       gp.initial_date,
       gp.final_date,
       gp.group_member_id,
       gp.role_id,
       r.name AS role_name,
       gp.is_current,
       gp.active,
       gp.created_by,
       gp.updated_by,
       gp.created_at,
       gp.updated_at
FROM gm_periods gp
         LEFT JOIN roles r ON gp.role_id = r.id;