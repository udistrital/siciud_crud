SELECT itd.id,
       itd.proposal_budget_id,
       itd.description,
       itd.justification,
       itd.estimated_date,
       itd.quantity,
       itd.individual_cost,
       itd.subtotal,
       itd.proposal_id,
       itd.source_id,
       s.st_name AS source_name,
       itd.state_id,
       st.st_name AS state_name,
       itd.requested_amount,
       itd.executed_amount,
       itd.balance,
       itd.approved,
       itd.payments,
       itd.notified_due_to_expire,
       itd.notified_expired,
       itd.active,
       itd.created_by,
       itd.updated_by,
       itd.created_at,
       itd.updated_at
FROM item_details itd
LEFT JOIN subtypes s ON itd.source_id = s.id
LEFT JOIN subtypes st ON itd.state_id = s.id;