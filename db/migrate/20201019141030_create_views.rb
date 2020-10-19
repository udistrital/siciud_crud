# https://roberteshleman.com/blog/2014/09/18/using-postgres-views-with-rails
# https://www.netguru.com/codestories/database-views-and-how-to-use-them-in-a-ror-based-app
# db/migrate/20201012050035_create_research_units_view.rb
class CreateViews < ActiveRecord::Migration[5.2]
  def up
		execute <<-SQL
			CREATE VIEW geo_cities AS
				SELECT
					st.country_id,
					co.name AS country_name,
					co.iso2 AS country_iso2,
					co.iso3 AS country_iso3,
					co.capital_name AS country_capital_name,
					co.currency AS country_currency,
					ci.state_id,
					st.name AS state_name,
					st.code AS state_code,
					ci.id AS city_id,
					ci.name AS city_name,
					ci.latitude AS city_latitude,
					ci.longitude AS city_longitude
				FROM ((geo_state st
					LEFT JOIN geo_country co ON ((st.country_id = co.id)))
					RIGHT JOIN geo_city ci ON ((st.id = ci.state_id)));
			CREATE VIEW research_units AS
				SELECT
					rg.id,
					rg.name,
					rg.acronym,
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
					(SELECT NAME FROM public.group_types WHERE id = rg.group_type_id) AS group_type_name,
					rg.group_state_id,
					(SELECT NAME FROM public.group_states WHERE id = rg.group_type_id) AS group_state_name,
					rg.interinstitutional,
					ARRAY(SELECT researcher_id FROM public.group_members WHERE research_group_id = rg.id) AS member_ids,
					ARRAY(SELECT faculty_id FROM public.faculty_ids_research_groups WHERE research_group_id = rg.id) AS faculty_ids,
					ARRAY(SELECT cine_detailed_area_id FROM public.cine_detailed_areas_research_groups WHERE research_group_id = rg.id) AS cine_detailed_area_ids,
					ARRAY(SELECT curricular_project_id FROM public.curricular_prj_ids_research_groups WHERE research_group_id = rg.id) AS curricular_project_ids,
					ARRAY(SELECT oecd_discipline_id FROM public.oecd_disciplines_research_groups WHERE research_group_id = rg.id) AS oecd_discipline_ids,
					ARRAY(SELECT research_focus_id FROM public.research_focuses_groups WHERE research_group_id = rg.id) AS research_focus_ids,
					rg.created_at,
					rg.updated_at
				FROM public.research_groups rg;
    SQL
  end

  def down
		execute <<-SQL
			DROP VIEW IF EXISTS geo_cities;
			DROP VIEW IF EXISTS research_units;
    SQL
  end
end
