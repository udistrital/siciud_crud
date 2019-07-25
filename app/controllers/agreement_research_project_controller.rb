class AgreementResearchProjectController < ApplicationController
  before_action :set_agreement, only: [:show, :update]

  def index
    #Listar todos los convenios
    @agreement_research_projects = AgreementResearchProject.all
    paginate json: @agreement_research_projects
  end

  def show
    render json: @agreement_research_project
  end

  def create
    @agreement_research_project = AgreementResearchProject.new(agreement_research_project_params)
    if @agreement_research_project.save
      render json: @agreement_research_project, status: :created
    else
      render json: @agreement_research_project.errors, status: :unprocessable_entity
    end
  end

  def update
    if @agreement_research_project.update(agreement_research_project_params)
      render json: @agreement_research_project
    else
      render json: @agreement_research_project.errors, status: :unprocessable_entity
    end
  end

  private

  def set_agreement_research_project
    @agreement_research_project = AgreementResearchProject.find(params[:id])
  end

  def agreement_research_project_params
    params.require(:agreement_research_project).permit(:code, :year, :startDate, :approbationDate, :estimatedFinishDate, :closingDate)
  end
end
