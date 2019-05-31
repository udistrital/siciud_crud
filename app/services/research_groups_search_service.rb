class ResearchGroupsSearchService
    def self.search(curr_research_groups,query,director)
        curr_research_groups = curr_research_groups.where("research_groups.name like '%#{query}%'") if query.present?
        #curr_research_groups = curr_research_groups.where("name like ?", "%#{keywords}%") if keywords.present?
        #curr_research_groups = curr_research_groups.joins(:faculties).where('faculties.id like 1') if facultyid.present?
        curr_research_groups = curr_research_groups.joins(members: :researcher).where("researchers.name like '%#{director}%'") if director.present?
        #curr_research_groups = curr_research_groups.faculties.where(category_id: category_id) if category_id.present?
        #curr_research_groups = curr_research_groups.where("price >= ?", min_price) if min_price.present?
        #products = curr_research_groups.where("price <= ?", max_price) if max_price.present?
        #curr_research_groups
    end
end