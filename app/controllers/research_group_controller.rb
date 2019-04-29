class ResearchGroupController < ApplicationController
    before_action :set_research_group, only: [:show, :update]

  def index
    #Listar todos los grupos
    @research_groups = ResearchGroup.all
    render json: @research_groups
  end
  

  def show
    render json: @research_group
  end

  def create
    @research_group = ResearchGroup.new(research_group_params)

    if @research_group.save
      render json: @research_group, status: :created, location: @research_group
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
      params.require(:research_group).permit(:name,:acronym,:description,:faculty_id,:curricular_project_id,:cidcRegistrationDate,
        :cidcActNmber,:facultyActNumber,:facultyRegistrationDate,:state_group_id
        :snies_id,:email,:gruplac,:webpage,:mission,:vision,:research_focus_id,:research_focus_id)

    end
end
