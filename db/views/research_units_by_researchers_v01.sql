SELECT rs.id,
       rs.identification_number,
       rs.oas_researcher_id,
       rs.active AS researcher_is_active,
       gm.id AS group_member_id,
       gm.role_id,
       rl.name AS role_name,
       gm.gm_state_id,
       gm.active AS group_member_is_active,
       gm.research_group_id,
       rg.name AS research_unit_name,
       rg.acronym,
       rg.group_type_id,
       rg.group_state_id,
       rg.legacy_siciud_id
FROM researchers rs
INNER JOIN group_members gm ON gm.researcher_id = rs.id
INNER JOIN roles rl ON rl.id = gm.role_id
INNER JOIN research_groups rg on gm.research_group_id = rg.id;