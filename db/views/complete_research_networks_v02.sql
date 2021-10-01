SELECT rn.id,
       rn.name,
       rn.acronym,
       rn.academic_responsibilities,
       rn.advantage,
       rn.cine_broad_area_id,
       cba.name    AS cine_broad_area_name,
       rn.cine_specific_area_id,
       csa.name    AS cine_specific_area_name,
       rn.financial_responsibilities,
       rn.legal_responsibilities,
       rn.main_research_group_id,
       rg.name     AS main_research_group_name,
       rn.mission,
       rn.network_type_id,
       snt.st_name AS network_type_name,
       rn.oecd_knowledge_area_id,
       oka.name    AS oecd_knowledge_area_name,
       rn.oecd_knowledge_subarea_id,
       oks.name    AS oecd_knowledge_subarea_name,
       rn.researcher_id,
       r.identification_number AS researcher_identification_number,
       rn.request_date,
       rn.vision,
       rn.active,
       rn.created_by,
       rn.updated_by,
       rn.created_at,
       rn.updated_at
FROM research_networks rn
         LEFT JOIN cine_broad_areas cba on rn.cine_broad_area_id = cba.id
         LEFT JOIN cine_specific_areas csa on rn.cine_specific_area_id = csa.id
         LEFT JOIN research_groups rg on rn.main_research_group_id = rg.id
         LEFT JOIN subtypes snt on rn.network_type_id = snt.id
         LEFT JOIN oecd_knowledge_areas oka on rn.oecd_knowledge_area_id = oka.id
         LEFT JOIN oecd_knowledge_subareas oks on rn.oecd_knowledge_subarea_id = oks.id
         LEFT JOIN researchers r on rn.researcher_id = r.id;