SELECT hc.id,
       hc.contact_id,
       c.name AS contact_name,
       c.email AS contact_email,
       c.phone AS contact_phone,
       hc.dependency_id,
       hc.is_current,
       hc.active,
       hc.created_by,
       hc.updated_by,
       hc.created_at,
       hc.updated_at
FROM hist_contacts hc
LEFT JOIN contacts c on hc.contact_id = c.id;