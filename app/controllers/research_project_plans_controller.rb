class ResearchProjectPlansController < ApplicationController
  before_action :set_research_project_plan, only: [:show, :update, :destroy]

  # GET /research_project_plans
  def index
    @research_project_plans = ResearchProjectPlan.all

    render json: @research_project_plans
  end

  # GET /research_project_plans/1
  def show
    render json: @research_project_plan
  end

  # POST /research_project_plans
  def create
    @research_project_plan = ResearchProjectPlan.new(research_project_plan_params)

    if(proyect = research_project_plan_params[:proyect])
      @research_project_plan.proyect = proyecto
    end
    if(description = research_project_plan_params[:description])
      @research_project_plan.description = description
    end
    if(goal = research_project_plan_params[:goal])
      @research_project_plan.goal = goal
    end
    if(period_id = research_project_plan_params[:period_id])
      @research_project_plan.period_id = period_id
    end
    if @research_project_plan.save
      render json: @research_project_plan, status: :created, location: @research_project_plan
    else
      render json: @research_project_plan.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /research_project_plans/1
  def update
    if @research_project_plan.update(research_project_plan_params)
      render json: @research_project_plan
    else
      render json: @research_project_plan.errors, status: :unprocessable_entity
    end
  end

  # DELETE /research_project_plans/1
  def destroy
    @research_project_plan.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_research_project_plan
      @research_project_plan = ResearchProjectPlan.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def research_project_plan_params
      params.require(:research_project_plan).permit(:proyect, :description, :goal, :period_id)
    end
end
