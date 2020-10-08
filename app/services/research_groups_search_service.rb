class ResearchGroupsSearchService < ApplicationService

  def self.filter_by_type(curr_research_groups, gt_id)
    groups = curr_research_groups.where("group_type_id = #{gt_id}") if gt_id.present?
    groups
  end

  def self.search(curr_research_groups, name, facultyid, director, category)
    #Filtarar por nombre
    curr_research_groups = curr_research_groups.where("research_groups.name like '%#{name}%'") if name.present?
    #Filtrar por facultad
    # curr_research_groups = curr_research_groups.joins(:faculties).where("faculties.id = '%#{facultyid}%'") if facultyid.present?
    #Filtrar por categoria de colciencias
    curr_research_groups = curr_research_groups.joins(historical_colciencias_ranks: :colciencias_category).where("colciencias_categories.name like '%#{category}%'") if category.present?
    #filtrar por nombre del director
    #curr_research_groups = curr_research_groups.joins(members: :researcher).where("members.role_id like 1").where("researchers.name like '%#{director}%'") if director.present?
    curr_research_groups.order(:created_at)
  end


  private

  def self.get_valid_filter_fields
    rg_fields = %w[id name acronym cidc_act_number faculty_act_number
                email gruplac webpage colciencias_code snies_id group_type_id
                group_state_id]
    gt_fields = ["group_type_name"]
    gs_fields = ["state_name"]
    rg_fields + gt_fields + gs_fields
  end

  def self.get_valid_sort_fields
    rg_fields = %w[id name acronym cidc_act_number faculty_act_number
                email gruplac webpage colciencias_code snies_id group_type_id
                group_state_id cidc_registration_date faculty_registration_date]
    gt_fields = ["group_type_name"]
    gs_fields = ["state_name"]
    rg_fields + gt_fields + gs_fields
  end

  def self.get_general_dictionary
    dictionary = {"id" => "research_groups.id",
                  "name" => "research_groups.name",
                  "acronym" => "research_groups.acronym",
                  "cidc_act_number" => "research_groups.cidc_act_number",
                  "cidc_registration_date" => "research_groups.cidc_registration_date",
                  "colciencias_code" => "research_groups.colciencias_code",
                  "email" => "research_groups.email",
                  "faculty_act_number" => "research_groups.faculty_act_number",
                  "faculty_registration_date" => "research_groups.faculty_registration_date",
                  "group_state_id" => "research_groups.group_state_id",
                  "group_type_id" => "research_groups.group_type_id",
                  "gruplac" => "research_groups.gruplac",
                  "snies_id" => "research_groups.snies_id",
                  "webpage" => "research_groups.webpage",
                  "group_type_name" => "group_types.name",
                  "state_name" => "group_states.name"}
    dictionary
  end
end