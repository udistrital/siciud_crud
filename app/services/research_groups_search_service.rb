class ResearchGroupsSearchService
    def self.search(curr_research_groups,query)
        curr_research_groups.where("name like '%#{query}%'")
    end
end