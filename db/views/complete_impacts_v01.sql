SELECT im.id,
       im.impact_type_id,
       sim.st_name AS impact_type_name,
       im.indicator_id,
       i.ind_description AS indicator_description,
       im.description,
       im.goal,
       im.term_id,
       st.st_name AS term_name,
       im.proposal_id,
       im.active,
       im.created_by,
       im.updated_by,
       im.created_at,
       im.updated_at
FROM impacts im
         LEFT JOIN subtypes sim on im.impact_type_id = sim.id
         LEFT JOIN indicators i on im.indicator_id = i.id
         LEFT JOIN subtypes st on im.term_id = st.id