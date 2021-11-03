SELECT c.id,
       c.call_name,
       c.call_code,
       c.call_beneficiary_id,
       sb.st_name AS call_beneficiary_name,
       c.call_directed_towards,
       c.call_duration,
       c.call_global_budget,
       c.call_max_budget_per_project,
       c.call_objective,
       c.call_start_date,
       c.call_end_date,
       c.call_state_id,
       ss.st_name AS call_state_name,
       c.call_type_id,
       st.st_name AS call_type_name,
       c.active,
       c.created_at,
       c.updated_at,
       c.created_by,
       c.updated_by
FROM calls c
         LEFT JOIN subtypes sb on sb.id = c.call_beneficiary_id
         LEFT JOIN subtypes ss ON ss.id = c.call_state_id
         LEFT JOIN subtypes st ON st.id = c.call_type_id;