SELECT acsc.id,
       acsc.name,
       acsc.start_date,
       acsc.end_date,
       acsc.proposal_id,
       acev.notified_due_to_expire,
       acev.notified_expired,
       acev.state_id,
       s.st_name AS state_name,
       acev.is_completed
FROM activity_schedules acsc
    LEFT JOIN activity_evaluations acev ON acsc.id = acev.activity_schedule_id
    LEFT JOIN subtypes s ON acev.state_id = s.id