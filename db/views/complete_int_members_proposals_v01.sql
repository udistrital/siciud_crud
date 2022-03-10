SELECT imp.id,
       (SELECT json_build_object(
                       'id', id,
                       'orcid_id', orcid_id,
                       'identification_number', identification_number,
                       'oas_researcher_id', oas_researcher_id,
                       'mobile_number_one', mobile_number_one,
                       'mobile_number_two', mobile_number_two,
                       'address', address,
                       'phone_number_one', phone_number_one,
                       'phone_number_two', phone_number_two
           )
        FROM researchers
        WHERE imp.researcher_id = id) AS researcher,
       imp.proposal_id,
       imp.role_id,
       r.name AS role_name,
       imp.active,
       imp.created_by,
       imp.updated_by,
       imp.created_at,
       imp.updated_at
FROM internal_members_proposals imp
         LEFT JOIN roles r on r.id = imp.role_id;