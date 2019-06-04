class ResearchSeedbedsSearchService
    def self.search(curr_research_seedbeds,name,facultyid,director)
        #curr_research_seedbeds.where("name like '%#{query}%'")
        curr_research_seedbeds = curr_research_seedbeds.where("research_groups.name like '%#{name}%'") if name.present?
        #Filtrar por facultad
        curr_research_seedbeds = curr_research_seedbeds.joins(:faculties).where("faculties.id like '%#{facultyid}%'") if facultyid.present?
        #filtrar por nombre del director
        curr_research_seedbeds = curr_research_seedbeds.joins(members: :researcher).where("members.role_id like 1").where("researchers.name like '%#{director}%'") if director.present?
        curr_research_seedbeds
    end
end