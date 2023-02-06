SELECT pb.id,
       pb.call_item_id,
       ci.item_id,
       sci.st_name AS item_name,
       pb.amount_request_cidc,
       pb.counterparty,
       pb.amount_in_kind,
       pb.subtotal,
       pb.proposal_id,
       pb.active,
       pb.created_by,
       pb.updated_by,
       pb.created_at,
       pb.updated_at
FROM proposal_budgets pb
         LEFT JOIN call_items ci ON pb.call_item_id = ci.id
         LEFT JOIN subtypes sci ON ci.item_id = sci.id