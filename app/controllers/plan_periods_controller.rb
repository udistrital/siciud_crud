class PlanPeriodsController < ApplicationController
  before_action :set_context
  before_action :set_plan_period, only: [:show, :update, :destroy]

  # GET /plan_periods
  def index
    @plan_periods = @context.plan_periods.all

    render json: @plan_periods
  end

  # GET /plan_periods/1
  def show
    render json: @plan_period
  end

  # POST /plan_periods
  def create
    @plan_period = @context.plan_periods.new(plan_period_params)
    if (description = plan_period_params[:description])
      @plan_period.description = description
    end

    if @plan_period.save
      render json: @plan_period, status: :created
      #, location: @plan_period
    else
      render json: @plan_period.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /plan_periods/1
  def update
    if @plan_period.update(plan_period_params)
      render json: @plan_period
    else
      render json: @plan_period.errors, status: :unprocessable_entity
    end
  end

  # DELETE /plan_periods/1
  def destroy
    @plan_period.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_plan_period
    @plan_period = @context.plan_periods.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def plan_period_params
    params.require(:plan_period).permit(:description)
  end

  #Function that implements the polymorphic association
  #for more info see https://richonrails.com/articles/polymorphic-associations-in-rails controllers section
  def context
    if params[:research_group_id]
      id = params[:research_group_id]
      ResearchGroup.find(params[:research_group_id])
    elsif params[:research_seedbed_id]
      id = params[:research_seedbed_id]
      ResearchSeedbed.find(params[:research_seedbed_id])
    end
  end

  def context_url(context)
    if ResearchGroup === context
      research_group_path(context)
    elsif ResearchSeedbed === context
      research_seedbed_path(context)
    end
  end

  def set_context
    @context = context
  end
end
