class ResearchGroupsSearchService
    def self.search(curr_research_groups,name,facultyid,director,category)
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
end