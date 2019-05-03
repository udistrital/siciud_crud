class ResearchGroupController < ApplicationController
    before_action :set_research_group, only: [:show, :update]

  def index
    #Listar todos los grupos
    @research_groups = ResearchGroup.all
    #Director .members.where("role_id='1'")
    render json: @research_groups.includes(:faculties,:curricular_projects,:research_focuses,:members)
  end
  

  def show
    render json: @research_group
  end

  def create
    @research_group = ResearchGroup.new(research_group_params)

    if @research_group.save
      render json: @research_group, status: :created
    else
      render json: @research_group.errors, status: :unprocessable_entity
    end
  end

  def update
    if @research_group.update(research_group_params)
      render json: @research_group
    else
      render json: @research_group.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_research_group
      @research_group = ResearchGroup.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def research_group_params
      params.require(:research_group).permit(:name,:acronym,:description,:cidcRegistrationDate,
        :cidcActNmber,:facultyActNumber,:facultyRegistrationDate,:state_group_id,
        :snies_id,:email,:colcienciasCode,:gruplac,:webpage,:mission,:vision,
        research_focus_ids: [],faculty_ids: [],curricular_project_ids: [])

    end
end
