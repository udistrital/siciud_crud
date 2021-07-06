SELECT u.id,
       u.identification_number,
       u.oas_user_id,
       u.user_role_id,
       ur.name AS user_role_name,
       u.faculties_ids,
       array_length(u.faculties_ids, 1) AS total_faculties,
       (SELECT COUNT(*) FROM group_members gm WHERE r.id = gm.researcher_id ) AS total_structures,
       (SELECT COUNT(*) FROM group_members gm WHERE r.id = gm.researcher_id AND gm.gm_state_id = 1) AS total_active_structures,
       (SELECT COUNT(*) FROM group_members gm WHERE r.id = gm.researcher_id AND gm.gm_state_id = 2) AS total_inactive_structures,
       u.active,
       u.created_by,
       u.updated_by,
       u.created_at,
       u.updated_at
FROM users u
         LEFT JOIN user_roles ur ON u.user_role_id = ur.id
         LEFT JOIN researchers r on u.identification_number = r.identification_number;