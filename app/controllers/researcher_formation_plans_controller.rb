class ResearcherFormationPlansController < ApplicationController
  before_action :set_researcher_formation_plan, only: [:show, :update, :destroy]

  # GET /researcher_formation_plans
  def index
    @researcher_formation_plans = ResearcherFormationPlan.all

    render json: @researcher_formation_plans
  end

  # GET /researcher_formation_plans/1
  def show
    render json: @researcher_formation_plan
  end

  # POST /researcher_formation_plans
  def create
    @researcher_formation_plan = ResearcherFormationPlan.new(researcher_formation_plan_params)

    if @researcher_formation_plan.save
      render json: @researcher_formation_plan, status: :created, location: @researcher_formation_plan
    else
      render json: @researcher_formation_plan.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /researcher_formation_plans/1
  def update
    if @researcher_formation_plan.update(researcher_formation_plan_params)
      render json: @researcher_formation_plan
    else
      render json: @researcher_formation_plan.errors, status: :unprocessable_entity
    end
  end

  # DELETE /researcher_formation_plans/1
  def destroy
    @researcher_formation_plan.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_researcher_formation_plan
      @researcher_formation_plan = ResearcherFormationPlan.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def researcher_formation_plan_params
      params.require(:researcher_formation_plan).permit(:activity, :description, :goal, :period_id)
    end
end
