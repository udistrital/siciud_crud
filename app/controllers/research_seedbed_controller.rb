class ResearchSeedbedController < ApplicationController
    before_action :set_research_group, only: [:show, :update,:attach]

  def index
    @research_seedbeds = ResearchSeedBed.all
    #Director .members.where("role_id='1'")
    # if params[:search].present? && !params[:search].nil?  
    #   @research_groups = ResearchGroupsSearchService.search(@research_groups,params[:search])
    # end
    paginate json: @research_seedbeds
    #.includes(:faculties,:curricular_projects,:research_focuses,
     # :state_group,:snies,:cidcActDocument_attachment,:facultyActDocument_attachment), per_page: 10
  end
  
  
  def show
      render json: @research_seedbed
  end

  def create
    @research_seedbed = ResearchSeedBed.new(research_seedbed_params)
    if @research_group.save
      render json: @research_seedbed, status: :created
    else
      render json: @research_seedbed.errors, status: :unprocessable_entity
    end
  end

  def update
    if @research_seedbed.update(research_seedbed_params)
      render json: @research_seedbed
    else
      render json: @research_seedbed.errors, status: :unprocessable_entity
    end
  end

    def attach
     params.permit(:facultyActDocument,:cidcActDocument)
    @research_seedbed.facultyActDocument.attach(params[:facultyActDocument])
    @researchresearch_seedbed_group.cidcActDocument.attach(params[:cidcActDocument])

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_research_seedbed
      @research_seedbed = ResearchSeedBed.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def research_seedbed_params
      params.require(:research_seed_bed).permit(:name,:acronym,:description,:cidcRegistrationDate,
        :cidcActNumber,:facultyActNumber,:facultyRegistrationDate,:state_seedbed_id,
        :snies_id,:mail,:webpage,:mission,:vision,:facultyActDocument,:cidcActDocument,:faculty_ids,
        :research_focus_ids,:curricular_project_ids)

    end
end


end
