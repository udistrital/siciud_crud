SELECT r.id,
       r.name,
       r.consequence,
       r.mitigation,
       r.proposal_id,
       ARRAY(
           SELECT asr.activity_schedule_id
           FROM  activity_schedules_risks asr
           WHERE r.id = asr.risk_id) AS activity_schedule_ids,
       r.active,
       r.created_by,
       r.updated_by,
       r.created_at,
       r.updated_at
FROM risks r;