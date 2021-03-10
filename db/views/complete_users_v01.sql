SELECT u.id,
       u.identification_number,
       u.oas_user_id,
       u.user_role_id,
       ur.name AS user_role_name,
       u.active,
       u.created_by,
       u.updated_by,
       u.created_at,
       u.updated_at
FROM users u
LEFT JOIN user_roles ur ON u.user_role_id = ur.id;