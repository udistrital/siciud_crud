class ResearchGroupsSearchService
    def self.search(curr_research_groups,name,facultyid,director,category)
        #Filtarar por nombre
        curr_research_groups = curr_research_groups.where("research_groups.name like '%#{name}%'") if name.present?
        #curr_research_groups = curr_research_groups.where("name like ?", "%#{keywords}%") if keywords.present?
        #Filtrar por facultad
        curr_research_groups = curr_research_groups.joins(:faculties).where("faculties.id like '%#{facultyid}%'") if facultyid.present?
        #Filtrar por categoria de colciencias
        curr_research_groups = curr_research_groups.joins(historical_colciencias_ranks: :colciencias_category).where("colciencias_categories.name like '%#{category}%'") if category.present?
        #filtrar por nombre del director
        curr_research_groups = curr_research_groups.joins(members: :researcher).where("members.role_id like 1").where("researchers.name like '%#{director}%'") if director.present?
        #curr_research_groups = curr_research_groups.faculties.where(category_id: category_id) if category_id.present?
        #curr_research_groups = curr_research_groups.where("price >= ?", min_price) if min_price.present?
        #products = curr_research_groups.where("price <= ?", max_price) if max_price.present?
        curr_research_groups
    end
end