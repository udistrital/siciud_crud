SELECT r.name,
       r.parent_id,
       rp.name AS parent_name,
       r.role_type_id,
       st.st_name AS role_type_name,
       r.active,
       r.created_by,
       r.updated_by,
       r.created_at,
       r.updated_at
FROM roles r
         LEFT JOIN subtypes st on r.role_type_id = st.id
         LEFT JOIN roles rp on r.parent_id = rp.id