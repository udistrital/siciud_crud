SELECT pp.id,
       pp.name,
       pp.product_type_id,
       pt.st_name AS product_type_name,
       pp.indicator_id,
       i.ind_description AS indicator_description,
       pp.beneficiary,
       pp.proposal_id,
       pp.active,
       pp.created_by,
       pp.updated_by,
       pp.created_at,
       pp.updated_at
FROM proposal_products pp
         LEFT JOIN subtypes pt on pp.product_type_id = pt.id
         LEFT JOIN indicators i on pp.indicator_id = i.id