class Api::V1::ArpGeneralGoalController < ApplicationController
  include Swagger::ArpGeneralGoalApi

  before_action :set_agreement_research_project
  before_action :validate_main_researcher
  before_action :set_arp_general_goal, only: [:show, :update]

  rescue_from ActiveRecord::RecordNotFound do |e|
    render json: {error: e.message}, status: :not_found
  end
  rescue_from ActiveRecord::RecordInvalid do |e|
    render json: {error: e.message}, status: :unprocessable_entity
  end

  def index
    #Listar todos los convenios
    @arp_general_goal = @agreement_research_project.arp_general_goal.order(:created_at)
    render json: @arp_general_goal
  end

  def show
    render json: @arp_general_goal
  end

  def create
    #byebug
    # Se utiliza build debido a que es una relacion de uno a uno
    @arp_general_goal = @agreement_research_project.build_arp_general_goal(arp_general_goal_params)
    if @arp_general_goal.save
      render json: @arp_general_goal, status: :created
    else
      render json: @arp_general_goal.errors, status: :unprocessable_entity
    end
  end

  def update
    if @arp_general_goal.update(arp_general_goal_params)
      render json: @arp_general_goal
    else
      render json: @arp_general_goal.errors, status: :unprocessable_entity
    end
  end

  private

  def validate_main_researcher
    if @agreement_research_project.agreement.arp_members.find_by(arp_role_id: 1).nil?
      return render json: {"error": "El Convenio No Cuenta con un investigador principal porfavor registre uno para poder continuar"}
    end
  end

  def set_arp_general_goal
    @arp_general_goal = @agreement_research_project.arp_general_goal.find_by(id: params[:id])
  end

  def arp_general_goal_params
    params.require(:arp_general_goal).permit(:goal)
  end

  def set_agreement_research_project
    #@agreement_research_project = @agreement.agreement_research_projects.find_by(id: params[:id])
    @agreement_research_project = AgreementResearchProject.find(params[:agreement_research_project_id])
  end
end
