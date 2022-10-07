SELECT ae.id,
       ae.activity_schedule_id,
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
       acs.active AS activity_schedule_active,
       acs.created_by AS activity_schedule_created_by,
       acs.updated_by AS activity_schedule_updated_by,
       acs.created_at AS activity_schedule_created_at,
       acs.updated_at AS activity_schedule_updated_at,
       ae.notified_due_to_expire,
       ae.notified_expired,
       ae.state_id,
       ss.st_name AS state_name,
       ae.active AS activity_evaluation_active,
       ae.created_by AS activity_evaluation_created_by,
       ae.updated_by AS activity_evaluation_updated_by,
       ae.created_at AS activity_evaluation_created_at,
       ae.updated_at AS activity_evaluation_updated_at
FROM activity_evaluations ae
LEFT JOIN activity_schedules acs ON acs.id = ae.activity_schedule_id
LEFT JOIN subtypes ss ON ss.id = ae.state_id