SELECT emp.id,
       (SELECT json_build_object(
                       'id', id,
                       'identification_number', identification_number,
                       'identification_type_id', identification_type_id,
                       'mobile', mobile,
                       'address', address,
                       'name', name,
                       'email', email,
                       'phone', phone)
        FROM contacts
        WHERE emp.contact_id = id) AS contact,
       emp.proposal_id,
       emp.role_id,
       r.name AS role_name,
       emp.active,
       emp.created_by,
       emp.updated_by,
       emp.created_at,
       emp.updated_at
FROM external_members_proposals emp
         LEFT JOIN roles r on r.id = emp.role_id;