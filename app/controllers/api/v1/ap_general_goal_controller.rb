class Api::V1::ApGeneralGoalController < ApplicationController
  include Swagger::ApGeneralGoalApi

  before_action :set_agreement_research_project
  before_action :set_ap_general_goal, only: [:show, :update]

  def index
    #Listar todos los convenios
    @ap_general_goal = @agreement_research_project.ap_general_goals
    render json: @ap_general_goal
  end

  def show
    render json: @ap_general_goal
  end

  def create
    #byebug
    @ap_general_goal = @agreement_research_project.ap_general_goals.new(ap_general_goal_params)
    if @ap_general_goal.save
      render json: @ap_general_goal, status: :created
    else
      render json: @ap_general_goal.errors, status: :unprocessable_entity
    end
  end

  def update
    if @ap_general_goal.update(ap_general_goal_params)
      render json: @ap_general_goal
    else
      render json: @ap_general_goal.errors, status: :unprocessable_entity
    end
  end

  def reportProgress
  end

  private

  def set_ap_general_goal
    @ap_general_goal = @agreement_research_project.ap_general_goals.find_by(id: params[:id])
  end

  def ap_general_goal_params
    params.require(:ap_general_goal).permit(:goal)
  end

  def set_agreement_research_project
    #@agreement_research_project = @agreement.agreement_research_projects.find_by(id: params[:id])
    @agreement_research_project = AgreementResearchProject.find(params[:agreement_research_project_id])
  end
end
