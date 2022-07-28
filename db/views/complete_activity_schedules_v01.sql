SELECT acs.id,
       acs.name,
       acs.description,
       acs.start_date,
       acs.end_date,
       acs.duration,
       acs.deliverable,
       acs.proposal_id,
       ARRAY(
           SELECT aso.objective_id
           FROM  activity_schedules_objectives aso
           WHERE acs.id = aso.activity_schedule_id) AS objective_ids,
       acs.active,
       acs.created_by,
       acs.updated_by,
       acs.created_at,
       acs.updated_at
FROM activity_schedules acs;