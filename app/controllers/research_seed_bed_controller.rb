class ResearchSeedBedController < ApplicationController
  def index
    @research_seed_beds = ResearchSeedBed.all
    #Director .members.where("role_id='1'")
    # if params[:search].present? && !params[:search].nil?  
    #   @research_groups = ResearchGroupsSearchService.search(@research_groups,params[:search])
    # end
    paginate json: @research_seed_beds
    #.includes(:faculties,:curricular_projects,:research_focuses,
     # :state_group,:snies,:cidcActDocument_attachment,:facultyActDocument_attachment), per_page: 10
  end
  
  

  def show
  end

  def create
  end

  def update
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_research_seed_bed
      @research_seed_bed = ResearchSeedBed.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def research_seed_bed_params
      params.require(:research_seed_bed).permit(:name,:acronym,:description,:cidcRegistrationDate,
        :cidcActNumber,:facultyActNumber,:facultyRegistrationDate,:state_seedbed_id,
        :snies_id,:mail,:webpage,:mission,:vision,:facultyActDocument,:cidcActDocument,:faculty_ids,
        :research_focus_ids,:curricular_project_ids)

    end
end


end
