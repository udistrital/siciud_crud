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
       itd.active,
       itd.created_by,
       itd.updated_by,
       itd.created_at,
       itd.updated_at
FROM item_details itd
LEFT JOIN subtypes s ON itd.source_id = s.id;