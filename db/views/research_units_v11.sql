SELECT
    rg.id,
    rg.legacy_siciud_id,
    rg.name,
    rg.acronym,
    rg.parent_id,
    (SELECT name FROM research_groups WHERE rg.parent_id = id) AS parent_name,
    (SELECT count(*) FROM research_groups WHERE rg.id = parent_id) AS child_structures_count,
    rg.description,
    rg.cidc_registration_date,
    rg.cidc_act_number,
    rg.faculty_act_number,
    rg.faculty_registration_date,
    rg.email,
    rg.gruplac,
    rg.webpage,
    rg.mission,
    rg.vision,
    rg.colciencias_code,
    rg.snies_id,
    rg.group_type_id,
    stgt.st_name AS group_type_name,
    rg.group_state_id,
    stgs.st_name AS group_state_name,
    rg.interinstitutional,
    ARRAY(SELECT researcher_id FROM group_members WHERE research_group_id = rg.id) AS member_ids,
    (SELECT count(*) FROM group_members WHERE group_members.research_group_id = rg.id) AS member_count,
    (SELECT count(*) FROM group_members WHERE group_members.research_group_id = rg.id AND gm_state_id = 1) AS active_member_count,
    (SELECT count(*) FROM group_members WHERE group_members.research_group_id = rg.id AND gm_state_id = 2) AS inactive_member_count,
    ARRAY(SELECT faculty_id FROM faculty_ids_research_groups WHERE research_group_id = rg.id) AS faculty_ids,
    (SELECT count(*) FROM faculty_ids_research_groups WHERE research_group_id = rg.id) AS total_faculties,
    rg.cine_broad_area_id,
    (SELECT name FROM cine_broad_areas WHERE id = rg.cine_broad_area_id) AS cine_broad_area_name,
    rg.cine_specific_area_id,
    (SELECT name FROM cine_specific_areas WHERE id = rg.cine_specific_area_id) AS cine_specific_area_name,
    ARRAY(SELECT cine_detailed_area_id FROM cine_detailed_areas_research_groups WHERE research_group_id = rg.id) AS cine_detailed_area_ids,
    ARRAY(SELECT curricular_project_id FROM curricular_prj_ids_research_groups WHERE research_group_id = rg.id) AS curricular_project_ids,
    rg.oecd_knowledge_area_id,
    (SELECT name FROM oecd_knowledge_areas WHERE id = rg.oecd_knowledge_area_id) AS oecd_knowledge_area_name,
    rg.oecd_knowledge_subarea_id,
    (SELECT name FROM oecd_knowledge_subareas WHERE id = rg.oecd_knowledge_subarea_id) AS oecd_knowledge_subarea_name,
    ARRAY(SELECT oecd_discipline_id FROM oecd_disciplines_research_groups WHERE research_group_id = rg.id) AS oecd_discipline_ids,
    ARRAY(SELECT subtype_id FROM research_focuses_units WHERE research_group_id = rg.id) AS research_focus_ids,
    rg.created_at,
    rg.updated_at,
    rg.created_by,
    rg.updated_by
FROM research_groups rg
         LEFT JOIN subtypes stgt on rg.group_type_id = stgt.id
         LEFT JOIN subtypes stgs on rg.group_state_id = stgs.id;