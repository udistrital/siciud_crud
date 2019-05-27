class ResearchSeedbedsSearchService
    def self.search(curr_research_seedbeds,query)
        curr_research_seedbeds.where("name like '%#{query}%'")
    end
end